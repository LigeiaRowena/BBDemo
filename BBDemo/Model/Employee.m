//
//  Employee.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "Employee.h"


@implementation Employee


- (id)initEmployeeWithObject:(id)object {
    if (self = [super init]) {
        if (!isEmptyObject(object) && [object isKindOfClass:[NSDictionary class]]) {
            self.fullName = [NSString stringWithFormat:@"%@ %@", object[@"name"], object[@"surname"]];
            self.email = object[@"email"];
            self.photo = object[@"photo"];
            self.role = object[@"role"];
            //self.role = object[@"role"];
        }
    }
    return self;
}


@end
