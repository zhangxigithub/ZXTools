#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@implementation ALAssetsLibrary(CustomPhotoAlbum)

-(void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    //write the image data to the assets library (camera roll)
    [self writeImageToSavedPhotosAlbum:image.CGImage orientation:(ALAssetOrientation)image.imageOrientation 
                        completionBlock:^(NSURL* assetURL, NSError* error) {
               
                            
                          if (error != nil) {
                              completionBlock(error);
                              return;
                          }

                          //add the asset to the custom photo album
                          [self addAssetURL:assetURL
                                    toAlbum:albumName 
                        withCompletionBlock:completionBlock];
                          
                      }];
}

-(void)addAssetURL:(NSURL*)assetURL toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock
{
    __block BOOL albumWasFound = NO;
    
    //search all photo albums in the library
    [self enumerateGroupsWithTypes:ALAssetsGroupAlbum 
                        usingBlock:^(ALAssetsGroup *group, BOOL *stop) {


                            if ([albumName compare: [group valueForProperty:ALAssetsGroupPropertyName]]==NSOrderedSame) {
                                

                                albumWasFound = YES;
                                

                                [self assetForURL: assetURL 
                                      resultBlock:^(ALAsset *asset) {
                                                  

                                          [group addAsset: asset];
                                          

                                          completionBlock(nil);
                                          
                                      } failureBlock: completionBlock];


                                return;
                            }
                            
                            if (group==nil && albumWasFound==NO) {

                                
                                __weak ALAssetsLibrary* weakSelf = self;

                                //create new assets album
                                [self addAssetsGroupAlbumWithName:albumName 
                                                      resultBlock:^(ALAssetsGroup *group) {
                                                                  

                                                          [weakSelf assetForURL: assetURL 
                                                                        resultBlock:^(ALAsset *asset) {


                                                                            [group addAsset: asset];
                                                                            

                                                                            completionBlock(nil);

                                                                        } failureBlock: completionBlock];
                                                          
                                                      } failureBlock: completionBlock];


                                return;
                            }
                            
                        } failureBlock: completionBlock];
    
}

@end
