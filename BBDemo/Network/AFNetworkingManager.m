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


+ (void)getMembers:(void (^)(NSDictionary *members, NSError *error))completionHandler {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:getMembersURL]];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        NSMutableDictionary *responseDictionary = @{}.mutableCopy;
        if (!error && [responseObject isKindOfClass:[NSDictionary class]]) {
            for (NSString *department in [responseObject allKeys]) {
                NSMutableArray *responseArray = @[].mutableCopy;
                for (NSDictionary *memberDict in responseObject[department]) {
                    Employee *employee = [[Employee alloc] initEmployeeWithObject:memberDict];
                    employee.department = department;
                    [responseArray addObject:employee];
                }
                [responseDictionary setObject:responseArray forKey:department];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            completionHandler(responseDictionary, error);
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
