//
//  IBPatientListController.h
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "IBBaseTableViewController.h"

@interface IBPatientListController : IBBaseTableViewController
{
    NSMutableArray *userArray;
    
}
@property (strong, nonatomic) NSMutableArray *filteredData;

@end
