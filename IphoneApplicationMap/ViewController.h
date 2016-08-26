//
//  ViewController.h
//  IphoneApplicationMap
//
//  Created by Vadim's Mac on 8/25/16.
//  Copyright © 2016 Vadim's Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    __strong IBOutlet UITextField *usernameTextField;
      NSDictionary *credentialDictionary;
    __strong IBOutlet UITextField *passwordTextField;
}
- (IBAction)Login:(UIButton *)sender;

@end

