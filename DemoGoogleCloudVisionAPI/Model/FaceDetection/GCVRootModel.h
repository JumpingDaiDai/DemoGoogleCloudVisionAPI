//
//  GCVRootModel.h
//  DemoGoogleCloudVisionAPI
//
//  Created by AlanYen on 2016/2/24.
//  Copyright © 2016年 17Life. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GCVCompletionBlock)(NSDictionary *responseDict, NSDictionary *errorDict);

@interface GCVRootModel : NSObject

+ (void)sendPostRequestWithBaseURL:(NSURL *)baseURL
                            action:(NSString *)action
                         imageData:(NSString *)imageString
                         maxResult:(NSInteger)maxResult
                        completion:(GCVCompletionBlock)completion;

+ (NSURL *)baseURL;

@end