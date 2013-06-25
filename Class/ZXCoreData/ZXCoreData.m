//
//  ZXCoreData.m
//  demo
//
//  Created by 张玺 on 13-4-6.
//  Copyright (c) 2013年 张玺. All rights reserved.
//

#import "ZXCoreData.h"


@implementation ZXCoreData

@synthesize managedObjectModel         = _managedObjectModel;
@synthesize managedObjectContext       = _managedObjectContext;
@synthesize tempContext                = _tempContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize childThreadManagedObjectContext = _childThreadManagedObjectContext;



static ZXCoreData *zxCoreData;
+(ZXCoreData*)sharedZXCoreData
{
    if(zxCoreData != nil) return zxCoreData;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zxCoreData = [[ZXCoreData alloc] init];
    });
    return zxCoreData;
}


- (void)saveContext
{
    NSError *error;
    if (_managedObjectContext != nil) {
        if ([_managedObjectContext hasChanges] && ![_managedObjectContext save:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }
//    if (_childThreadManagedObjectContext != nil) {
//        if ( [_childThreadManagedObjectContext hasChanges] &&
//            ![_childThreadManagedObjectContext save:&error]) {
//            
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        }
//    }

}


#pragma mark -
#pragma mark Core Data stack

- (NSManagedObjectContext*)childThreadContext
{
    if (_childThreadManagedObjectContext != nil)
    {
        return _childThreadManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        _childThreadManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_childThreadManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }else
        NSAssert(NO, @"coordinator 不能为空");
    
    
    [_childThreadManagedObjectContext setStalenessInterval:0.0];
    [_childThreadManagedObjectContext setMergePolicy:NSOverwriteMergePolicy];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mergeContextChangesForNotification:)
                                                 name:NSManagedObjectContextDidSaveNotification
                                               object:_childThreadManagedObjectContext];
    
    return _childThreadManagedObjectContext;
}
- (void)mergeOnMainThread:(NSNotification *)aNotification
{
    NSLog(@"mergeOnMainThread");
    [[self managedObjectContext] mergeChangesFromContextDidSaveNotification:aNotification];
}

- (void)mergeContextChangesForNotification:(NSNotification *)aNotification
{
    NSLog(@"mergeContextChangesForNotification?");
    [self performSelectorOnMainThread:@selector(mergeOnMainThread:)
                           withObject:aNotification
                        waitUntilDone:YES];
}

- (NSManagedObjectContext *) tempContext
{
    if (_tempContext != nil) return _tempContext;
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    if (coordinator != nil) {
        _tempContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_tempContext setPersistentStoreCoordinator: coordinator];
    }
    return _tempContext;
}
- (NSManagedObjectContext *) managedObjectContext
{
    static dispatch_once_t contextToken;
    
    if (_managedObjectContext != nil) return _managedObjectContext;
    
    dispatch_once(&contextToken, ^{
       
        
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (coordinator != nil) {
            _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            [_managedObjectContext setPersistentStoreCoordinator: coordinator];
        }
        
    });
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) return _managedObjectModel;

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kZXCoreDataModalName withExtension:kZXCoreDataModalExtension];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
   
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) return _persistentStoreCoordinator;
    
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",kZXCoreDataFileName,kZXCoreDataFileExtension];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:[storeURL path]]) {
        
        /**
         NSURL *defaultStoreURL = [[NSBundle mainBundle] URLForResource:@"CoreDataBooks" withExtension:@"CDBStore"];
         if (defaultStoreURL) {
         [fileManager copyItemAtURL:defaultStoreURL toURL:storeURL error:NULL];
         }
         */
    }
    
    NSDictionary *options =@{NSMigratePersistentStoresAutomaticallyOption:@YES,
                             NSInferMappingModelAutomaticallyOption:@YES};
    
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: [self managedObjectModel]];
    
    NSError *error;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    return _persistentStoreCoordinator;
}

-(id)objectForName:(NSString *)name
{
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.managedObjectContext];
}
-(id)tempObjectForName:(NSString *)name
{
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.tempContext];
}
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError **)error
{
    return [self.managedObjectContext executeFetchRequest:request error:error];
}

#pragma mark -
#pragma mark Application's documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
