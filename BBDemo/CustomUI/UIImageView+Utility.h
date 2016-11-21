//
//  UIImageView+Utility.h
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (Utility)


/**
 * Request image property
 *
 * @param fileName photo's file name
 * @return true if the photo is a valid UIImage
 */
- (BOOL)setImageWithFileName:(NSString *)fileName;


@end
