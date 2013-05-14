//
//  Person.m
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize __firstName, __lastName, __emailAddress, __phoneNumber;

+ (Person *)initPersonWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                     emailAddress:(NSString *)emailAddress
                      phoneNumber:(NSString *)phoneNumber
{
    Person *person = [[Person alloc] init];
    person.__firstName = firstName;
    person.__lastName = lastName;
    person.__emailAddress = emailAddress;
    person.__phoneNumber = phoneNumber;
    
    return person;
}


@end
