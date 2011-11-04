
//
//  LoginViewController.h
//  CigratteApp
//
 //

#import <UIKit/UIKit.h>
#import "ModalController.h"
#import "MBProgressHUD.h"
#import "Constant.h"
#import "XMLReader.h"
#import "RegistrationViewController.h"
#import "LoginPageViewController.h"

@interface LoginViewController : UIViewController
{
    
    ModalController *modal;
}
-(IBAction)clickLogin:(id)sender;
-(IBAction)clickForRegis:(id)sender;


@end
