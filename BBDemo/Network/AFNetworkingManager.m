//
//  AFNetworkingManager.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "AFNetworkingManager.h"
#import "Employee.h"


@implementation AFNetworkingManager


#pragma mark - Requests


+ (void)getMembers:(void (^)(NSArray *members, NSError *error))completionHandler {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:getMembersURL]];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSMutableArray *responseArray = @[].mutableCopy;
        if (!error && [responseObject isKindOfClass:[NSDictionary class]]) {
            for (NSString *department in [responseObject allKeys]) {
                NSMutableArray *membersSortedArray = @[].mutableCopy;
                for (NSDictionary *memberDict in responseObject[department]) {
                    Employee *employee = [[Employee alloc] initEmployeeWithObject:memberDict];
                    employee.department = department;
                    [membersSortedArray addObject:employee];
                }
                NSDictionary *membersSortedDict = @{department: membersSortedArray};
                [responseArray addObject:membersSortedDict];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            completionHandler(responseArray, error);
        });
    }];
    [dataTask resume];
    
    

    
    // TODO: add reachibility feature
    /*
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    */
}


@end
