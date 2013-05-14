//
//  ViewController.m
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "ViewController.h"
#import "ShowViewController.h"
#import "NewPersonViewController.h"
#import "Person.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* __people;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addPersonWithButton:(id)sender;
- (IBAction)editWithButton:(id)sender;

@end

@implementation ViewController

@synthesize __people;
//@synthesize tableView;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        __people = [[NSMutableArray alloc] init];
        
        
        [__people addObject:[Person initPersonWithFirstName:@"Natasha" lastName:@"M" emailAddress:@"n@n.com" phoneNumber:@"654-987-1234"]];
        [__people addObject:[Person initPersonWithFirstName:@"Lucas" lastName:@"V" emailAddress:@"v@v.com" phoneNumber:@"765-987-90876"]];
        [__people addObject:[Person initPersonWithFirstName:@"Don" lastName:@"B" emailAddress:@"d@d.com" phoneNumber:@"987-975-9654"]];
        [__people addObject:[Person initPersonWithFirstName:@"Marina" lastName:@"M" emailAddress:@"m@m.com" phoneNumber:@"876-0987-8765"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [(UITableView *)self.view reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [__people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"person";
    UITableViewCell *cell = [(UITableView *)self.view dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    Person *person = ((Person *)__people[indexPath.row]);
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.__firstName, person.__lastName];
    cell.detailTextLabel.text = person.__emailAddress;
    
    return cell;
}


#pragma mark - Table View Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"tableToShowView" sender:indexPath];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[ShowViewController class]]) {
        ((ShowViewController *)segue.destinationViewController).person = (Person *)__people[((NSIndexPath *)sender).row];
    } else if ([segue.destinationViewController isKindOfClass:[NewPersonViewController class]]) {
       ((NewPersonViewController *)segue.destinationViewController).person = (Person *)[__people lastObject];
    }
}


- (IBAction)addPersonWithButton:(id)sender
{
    Person *person = [[Person alloc] init];
    [__people addObject:person];
    [self performSegueWithIdentifier:@"tableToAddPersonView" sender:self];
}

- (IBAction)editWithButton:(id)sender
{
    [(UITableView *)self.view setEditing:YES];
    // replace text of button to say done!
}


@end
