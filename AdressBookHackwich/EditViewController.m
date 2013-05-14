//
//  EditViewController.m
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "EditViewController.h"
#import "ShowViewController.h"

@interface EditViewController ()

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;

- (IBAction)doneEditingWithButton:(id)sender;
- (IBAction)cancelWithButton:(id)sender;

- (void)setTextFieldsForPerson;

@end

@implementation EditViewController

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
    [self setTextFieldsForPerson];
}

- (void)setTextFieldsForPerson
{
    firstNameTextField.text = person.__firstName;
    lastNameTextField.text = person.__lastName;
    emailAddressTextField.text = person.__emailAddress;
    phoneNumberTextField.text = person.__phoneNumber;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneEditingWithButton:(id)sender
{
    person.__firstName = firstNameTextField.text;
    person.__lastName = lastNameTextField.text;
    person.__emailAddress = emailAddressTextField.text;
    person.__phoneNumber = phoneNumberTextField.text;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)cancelWithButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
