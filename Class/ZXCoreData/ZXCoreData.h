//
//  ZXCoreData.h
//  demo
//
//  Created by 张玺 on 13-4-6.
//  Copyright (c) 2013年 张玺. All rights reserved.
//


#define kZXCoreDataModalName      @"model"
#define kZXCoreDataModalExtension @"momd"
#define kZXCoreDataFileName       @"zxcoredata"
#define kZXCoreDataFileExtension  @"sqlite"


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ZXCoreData : NSObject


@property (atomic,strong,readonly) NSManagedObjectModel         *managedObjectModel;
@property (atomic,strong,readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//主线程使用
@property (atomic,strong,readonly)    NSManagedObjectContext *managedObjectContext;
//其他线程使用
@property (atomic,strong,readonly)    NSManagedObjectContext *childThreadManagedObjectContext;
//临时上下文，用来生成临时对象，不会被写入磁盘
@property (atomic,strong,readonly)    NSManagedObjectContext *tempContext;




+(ZXCoreData*)sharedZXCoreData;
- (void)saveContext;


- (NSManagedObjectContext*)childThreadContext;

//生成对象，并存入库
-(id)objectForName:(NSString *)name;
//生成临时对象，
-(id)tempObjectForName:(NSString *)name;
//查询
- (NSArray *)executeFetchRequest:(NSFetchRequest *)request error:(NSError **)error;



@end
