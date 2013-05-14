//
//  Person.h
//  AdressBookHackwich
//
//  Created by Natasha Murashev on 5/13/13.
//  Copyright (c) 2013 Natasha Murashev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString* __firstName;
@property (strong, nonatomic) NSString* __lastName;
@property (strong, nonatomic) NSString* __emailAddress;
@property (strong, nonatomic) NSString* __phoneNumber;

+ (Person *)initPersonWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                     emailAddress:(NSString *)emailAddress
                      phoneNumber:(NSString *)phoneNumber;

@end
