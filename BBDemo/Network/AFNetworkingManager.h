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
 * @param completionHandler block with getMembers response/error
 */
+ (void)getMembers:(void (^)(NSDictionary *members, NSError *error))completionHandler;


@end
