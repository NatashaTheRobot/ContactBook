//
//  ShowViewController.m
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ShowViewController.h"
#import "EditViewController.h"

@interface ShowViewController ()

@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;

- (IBAction)editWithButton:(id)sender;

- (void)setLabelsForPerson;

@end

@implementation ShowViewController

@synthesize person;
@synthesize firstNameLabel, lastNameLabel, emailAddressLabel, phoneLabel;

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
    [self setLabelsForPerson];
    self.navigationItem.title = [NSString stringWithFormat:@"%@ %@", person.__firstName, person.__lastName];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self setLabelsForPerson];
}

- (void)setLabelsForPerson
{
    firstNameLabel.text = person.__firstName;
    lastNameLabel.text = person.__lastName;
    emailAddressLabel.text = person.__emailAddress;
    phoneLabel.text = person.__phoneNumber;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((EditViewController *)segue.destinationViewController).person = person;
}

- (IBAction)editWithButton:(id)sender
{
    [self performSegueWithIdentifier:@"showToEditView" sender:self];
}
@end
