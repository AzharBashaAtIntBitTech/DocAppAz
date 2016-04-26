//
//  IBUser.h
//  DocAppAzhar
//
//  Created by MacMini1 on 4/26/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBUser : NSObject
@property (nonatomic, strong) NSString *Provider_id;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *prefix;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *email;
@end
