//
//  IBBaseViewController.h
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBBaseViewController : UIViewController<UINavigationControllerDelegate>
@property (strong, nonatomic) NSMutableArray *dataArray;

- (IBAction)back:(id)sender;
- (IBAction)home:(id)sender;
- (IBAction)dismiss:(id)sender;


@end
