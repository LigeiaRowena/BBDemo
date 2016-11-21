//
//  DetailViewController.m
//  BBDemo
//
//  Created by Francesca Corsini on 20/11/16.
//  Copyright © 2016 Francesca Corsini. All rights reserved.
//

#import "DetailViewController.h"
#import "PhotoViewController.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *roleLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@end


@implementation DetailViewController


#pragma mark - Init/Launch ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    BOOL success = [self.imageView setImageWithFileName:self.employee.photo];
    self.employee.isValidPhoto = success;
    self.fullNameLabel.text = [NSString stringWithFormat:@"Full name: %@", self.employee.fullName];
    self.departmentLabel.text = [NSString stringWithFormat:@"Department: %@", self.employee.department];
    self.roleLabel.text = [NSString stringWithFormat:@"Role: %@", self.employee.role];
    self.emailLabel.text = [NSString stringWithFormat:@"Email: %@", self.employee.email];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:showPhotoSegue]) {
        PhotoViewController *destination = (PhotoViewController *)segue.destinationViewController;
        destination.photo = self.employee.photo;
    }
}



#pragma mark - Actions


- (IBAction)openPhoto:(id)sender {
    if (self.employee.isValidPhoto)
        [self performSegueWithIdentifier:showPhotoSegue sender:nil];
}


- (IBAction)sendEmail:(id)sender {
    if (![MFMailComposeViewController canSendMail]) {
        //TODO: show info alert
    }

    else if (isEmptyString(self.employee.email)) {
        MFMailComposeViewController *mcController = [[MFMailComposeViewController alloc] init];
        mcController.mailComposeDelegate = self;
        NSArray *recipients = @[self.employee.email];
        [mcController setToRecipients:recipients];
        mcController.mailComposeDelegate = self;
        [self presentViewController:mcController animated:YES completion:nil];
    }
}


#pragma mark - MFMailComposeViewControllerDelegate/MFMessageComposeViewControllerDelegate


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
