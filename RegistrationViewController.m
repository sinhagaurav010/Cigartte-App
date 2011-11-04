//
//  RegistrationViewController.m
//  CigratteApp
//
 //

#import "RegistrationViewController.h"

@implementation RegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)BackPad:(id)sender
{
    
}

#pragma mark -pickercustomer proctocols-

- (void)pickerOptionSelectedWithIndex:(NSInteger)index
{
    NSLog(@"%d",index);
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark -Register-
-(void)Register
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    pickerCigCat.hidden = NO;
    pickerCigCat.client = self;
    [self.navigationController setTitle:@"Registration"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sender"
                                                                             style:UIBarButtonItemStyleDone target:self
                                                                            action:@selector(Register)];
    [pickerCigCat addTheElement:[[NSMutableArray alloc]initWithArray:[NSArray arrayWithObjects:@"Lucky Strike",@"West",@"Marlboro", nil]]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
