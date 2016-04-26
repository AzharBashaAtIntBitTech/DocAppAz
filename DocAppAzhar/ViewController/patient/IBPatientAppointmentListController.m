//
//  IBPatientAppointmentListController.m
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "IBPatientAppointmentListController.h"
#import "IBBaseTableViewCell.h"
#import "IBDataManager.h"
#import "IBAppConstant.h"
@interface IBPatientAppointmentListController ()

@end

@implementation IBPatientAppointmentListController

#pragma mark - Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    [[IBDataManager getInstance]getDataFromURL:kallAppointments parameter:nil onSuccess:^(NSData *data) {
        NSLog(@"%@",data);
        //var dataString = NSString(data: data!, encoding:NSUTF8StringEncoding);
        NSString* myString;
        myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"data is : %@", myString);
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
    return 5;//self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    cell.appointmentList.text = @"Appointment";

    return cell;
}


@end
