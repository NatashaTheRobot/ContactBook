//
//  NewPersonViewController.m
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "NewPersonViewController.h"

@interface NewPersonViewController ()

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;

- (IBAction)doneWithButton:(id)sender;
- (IBAction)cancelWithButton:(id)sender;


@end

@implementation NewPersonViewController

@synthesize person;
@synthesize firstNameTextField, lastNameTextField, emailAddressTextField, phoneNumberTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneWithButton:(id)sender
{
    person.__firstName = firstNameTextField.text;
    person.__lastName = lastNameTextField.text;
    person.__emailAddress = emailAddressTextField.text;
    person.__phoneNumber = phoneNumberTextField.text;
    
    NSLog(@"person %@", person);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelWithButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
