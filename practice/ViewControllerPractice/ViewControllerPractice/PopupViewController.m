//
//  PopupViewController.m
//  ViewControllerPractice
//
//  Created by 김명유 on 2021/01/26.
//

#import "PopupViewController.h"
#import "PopupPresentationTransition.h"
#import "PopupDismissalTransition.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.backgroundView = [[UIView alloc] init];
    }
    return self;
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViewController)];
    self.backgroundView.userInteractionEnabled = YES;
    [self.backgroundView addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark - IBAction

- (IBAction)close:(id)sender {
    [self dismissViewController];
}

#pragma mark - Internal Methods

- (void)dismissViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    PopupPresentationTransition *animator = [[PopupPresentationTransition alloc] init];
    return animator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    PopupDismissalTransition *animator = [[PopupDismissalTransition alloc] init];
    return animator;
}

@end
