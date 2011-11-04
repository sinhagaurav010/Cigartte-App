//
//  RegistrationViewController.h
//  CigratteApp
//
 //

#import <UIKit/UIKit.h>
#import "PickerCustom.h"
@interface RegistrationViewController : UIViewController<CustomPickerDelegate>
{
    IBOutlet UIButton *buttonSend;
    IBOutlet UITextField *fieldNme;
    IBOutlet UITextField *fieldPass;
    IBOutlet UITextField *fieldEmail;
    IBOutlet PickerCustom *pickerCigCat;
    IBOutlet UITextField *fieldDes;
    IBOutlet UIScrollView *scrllView;
}
//-(IBAction)send:(id)sender;
-(IBAction)BackPad:(id)sender;

@end
