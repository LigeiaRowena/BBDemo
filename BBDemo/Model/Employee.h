//
//  Employee.h
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject


@property (nonatomic, strong) NSString *department;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *role;


/**
 * Init Employee object
 *
 * @param object data model
 */
- (id)initEmployeeWithObject:(id)object;


@end
