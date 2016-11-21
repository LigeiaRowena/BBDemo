//
//  UIImageView+Utility.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "UIImageView+Utility.h"


@implementation UIImageView (Utility)


#pragma mark - Utility methods


- (BOOL)setImageWithFileName:(NSString *)fileName
{
	// set activity view while client is loading the image
	UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	activity.color = [UIColor redColor];
	activity.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
	activity.hidesWhenStopped = YES;
	[self addSubview:activity];
	[activity startAnimating];
	
	// set a placeholder
    BOOL result = FALSE;
    self.image = [UIImage imageNamed:@"placeholder"];
    
    // get bytes to set image property
   	NSError *error = nil;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", getPhotoBaseURL, fileName]];
    if (url != nil) {
        NSData *data = [NSData dataWithContentsOfURL:url options:0 error:&error];
        UIImage *image = [UIImage imageWithData:data];
        if (image && !error) {
            self.image = image;
            result = TRUE;
        }
    }
    [activity stopAnimating];
    
    return result;
}


@end
