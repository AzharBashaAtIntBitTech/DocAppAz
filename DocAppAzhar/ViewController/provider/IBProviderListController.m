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
@interface IBProviderListController ()

@end

@implementation IBProviderListController
#pragma mark - Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[IBDataManager getInstance]getDataFromURL:kallProviders parameter:nil onSuccess:^(NSData *data) {
        NSLog(@"%@",data);
        NSDictionary *userResponse =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *userResponseArray = [[userResponse objectForKey:@"d"]objectForKey:@"providers"];
        NSLog(@"%@",userResponseArray);
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int index = 0; index< [userResponseArray count]; index++) {
            NSString *providerNames = [[userResponseArray objectAtIndex:index]objectForKey:@"fullName"];
            [array addObject:providerNames];
        }
        NSLog(@"%@", array);
        self.dataArray = array;
        //var dataString = NSString(data: data!, encoding:NSUTF8StringEncoding);
        NSString* myString;
        myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSLog(@"data is : %@", myString);
    } onError:^(NSError *error) {
        
    }];

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
    return 10;//self.dataArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IBBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default" forIndexPath:indexPath];
    cell.providerList.text = @"Provider";//[self.dataArray objectAtIndex:indexPath.row];//@"Provider";
    return cell;
}

@end
