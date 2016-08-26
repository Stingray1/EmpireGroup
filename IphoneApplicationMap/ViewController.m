//
//  ViewController.m
//  IphoneApplicationMap
//
//  Created by Vadim's Mac on 8/25/16.
//  Copyright © 2016 Vadim's Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    credentialDictionary =[[NSDictionary alloc]
                           initWithObjects:[NSArray arrayWithObjects:@"pass", nil]
                           forKeys:[NSArray arrayWithObjects:@"user", nil]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Login:(UIButton *)sender {
    
    if(![[credentialDictionary objectForKey:usernameTextField.text] isEqualToString:passwordTextField.text])
    { UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Incorrect Password"message:@"The Password is incorrect"
                                                              preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:NSLocalizedString(@"Ok", @"Cancel action")
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       { NSLog(@"Cancel action");}];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}
@end
