//
//  LoginPageViewController.h
//  CigratteApp
//
 //

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "MapViewController.h"

@interface LoginPageViewController : UIViewController
{
    UIButton *buttonLogin;
    UITextField *fieldUser;
    UITextField *fieldPass;
}
-(IBAction)backKeyPad:(id)sender;
-(IBAction)login:(id)sender;
@end
