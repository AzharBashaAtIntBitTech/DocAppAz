//
//  IBBaseTableViewCell.h
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IBBaseTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *providerList;
@property (weak, nonatomic) IBOutlet UILabel *patientList;
@property (weak, nonatomic) IBOutlet UILabel *appointmentList;

@end
