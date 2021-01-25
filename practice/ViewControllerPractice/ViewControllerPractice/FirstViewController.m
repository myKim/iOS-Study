//
//  ViewController.m
//  ViewControllerPractice
//
//  Created by 김명유 on 2021/01/24.
//

#import "FirstViewController.h"

#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showSecond:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Second"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)showPopup:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Popup"];
    
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
