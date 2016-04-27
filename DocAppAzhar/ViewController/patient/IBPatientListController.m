//
//  IBPatientListController.m
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "IBPatientListController.h"
#import "IBBaseTableViewCell.h"
#import "IBDataManager.h"
#import "IBUser.h"
#import "IBAppConstant.h"
@interface IBPatientListController ()

@end

@implementation IBPatientListController

#pragma mark - Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    [[IBDataManager getInstance]getDataFromURL:kallProviders parameter:nil onSuccess:^(NSData *data) {
        NSLog(@"%@",data);
        NSDictionary *userResponse =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *userResponseArray = [[userResponse objectForKey:@"d"]objectForKey:@"providers"];
        NSLog(@"%@",userResponseArray);
        userArray = [[NSMutableArray alloc]init];
        for (int index = 0; index< [userResponseArray count]; index++) {
            IBUser *user = [[IBUser alloc]init];
            user.lastName = [[userResponseArray objectAtIndex:index] objectForKey:@"lastName"];
            [userArray addObject:user];
        }
        [self setDataArray:[userArray copy]];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
//        NSString* myString;
//        myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//        NSLog(@"data is : %@", myString);
    } onError:^(NSError *error) {
        
    }];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - DataSource

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.filteredData) {
        return [self.filteredData count];
    }
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    IBUser *user = self.filteredData?self.filteredData[indexPath.row]:self.dataArray[indexPath.row];
    cell.patientList.text = [NSString stringWithFormat:@"%@",user.lastName];
    return cell;
}


@end
