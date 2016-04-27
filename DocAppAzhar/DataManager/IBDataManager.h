//
//  IBDataManager.h
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBDataManager : NSObject<NSURLSessionDelegate>
@property (nonatomic, strong) NSDictionary *BASE_URL;

+ (IBDataManager *)getInstance;

- (NSString *)getURL:(NSString *)ObjectKey;

- (void)getDataFromURL:(NSString *)baseUrl parameter:(NSDictionary *)dictParameter  onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError;

- (void)getAcessToken:(NSString *)baseUrl onSuccess:(void(^)(NSData *data))_onSuccess onError:(void(^)(NSError *error))_onError;

@end
