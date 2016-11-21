//
//  AFNetworkingManager.h
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AFNetworkingManager : NSObject


/**
 * Run getMembers request
 *
 * @param completionHandler block called when the request terminates
 */
+ (void)getMembers:(void (^)(NSArray *members, NSError *error))completionHandler;


@end
