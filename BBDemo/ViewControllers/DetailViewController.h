//
//  DetailViewController.h
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "MessageUI/MessageUI.h"


@interface DetailViewController : UIViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>


@property (nonatomic, strong) Employee *employee;


@end
