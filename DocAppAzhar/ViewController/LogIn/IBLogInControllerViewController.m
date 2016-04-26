//
//  IBLogInControllerViewController.m
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "IBLogInControllerViewController.h"

@interface IBLogInControllerViewController ()

@end

@implementation IBLogInControllerViewController

#pragma mark - Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
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

#pragma mark - Actions

- (IBAction)logInButton:(id)sender {
    if([self.userNameTextField.text isEqualToString:@"practice"] && [self.passwordTextField.text isEqualToString:@"password"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"practiceStoryBoard" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"IBProviderListController"];
        [self.navigationController showViewController:vc sender:nil];

        
    }else if([self.userNameTextField.text isEqualToString:@"provider"] && [self.passwordTextField.text isEqualToString:@"password"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"providerStoryBoard" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"IBPatientListController"];
        [self.navigationController showViewController:vc sender:nil];

        
    }else if([self.userNameTextField.text isEqualToString:@"patient"] && [self.passwordTextField.text isEqualToString:@"password"]){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"patientStoryBoard" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"IBPatientAppointmentListController"];
        [self.navigationController showViewController:vc sender:nil];

        
    }else{
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error"
                                      message:@"Invalid userName or password"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];


    }

}

@end
