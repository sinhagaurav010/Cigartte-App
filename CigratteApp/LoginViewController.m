//
//  LoginViewController.m
//  CigratteApp
//
 //

#import "LoginViewController.h"

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)clickLogin:(id)sender
{
    LoginPageViewController *loginController = [[LoginPageViewController alloc] init];
    [self.navigationController pushViewController:loginController animated:YES];
}
-(IBAction)clickForRegis:(id)sender
{
    RegistrationViewController *RegistrationController = [[RegistrationViewController alloc] init];
    [self.navigationController pushViewController:RegistrationController animated:YES];

}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
  NSLog(@"gveg");
//
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    
//    NSLog(@"gveg");
//    hud.labelText = @"Checking...";
//    
//    modal = [[ModalController alloc] init];
//    modal.delegate = self;
//    [modal sendTheRequestWithPostString:nil withURLString:URLHINDI];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)getdata
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"~~~~~~~~~~~~~~~~~~~~%@",modal.stringRx);
    NSString *stringHindi = [modal.stringRx stringByReplacingOccurrencesOfString:@"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/>" withString:@""];
    NSLog(@"%@",stringHindi);
    NSDictionary *_xmlDictionaryData = [XMLReader dictionaryForXMLData:[stringHindi  dataUsingEncoding:NSUTF8StringEncoding]  error:nil] ;
    NSLog(@"---------%@",_xmlDictionaryData);
}
-(void)getError
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [ModalController FuncAlertMsg:@"error in network"
                     inController:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
