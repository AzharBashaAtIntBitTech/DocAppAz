//
//  IBProviderListController.m
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "IBProviderListController.h"
#import "IBBaseTableViewCell.h"
#import "IBDataManager.h"
#import "IBAppConstant.h"
#import "IBUser.h"
@interface IBProviderListController ()

@end

@implementation IBProviderListController
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
            user.fullName = [[userResponseArray objectAtIndex:index] objectForKey:@"fullName"];
            [userArray addObject:user];
        }
        [self setDataArray:[userArray copy]];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } onError:^(NSError *error) {
        
    }];
    NSLog(@"%@", self.dataArray);

    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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

    cell.providerList.text = [NSString stringWithFormat:@"%@",user.fullName];
    return cell;
}

@end
