//
//  SecondViewController.m
//  ViewControllerPractice
//
//  Created by 김명유 on 2021/01/24.
//

#import "SecondViewController.h"
#import "CustomTransitionAnimation.h"

@interface SecondViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation SecondViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.transitioningDelegate = self;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

// 리턴 객체가 유효하면 interactionControllerForPresentation:를 호출 함
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return nil;
}

// 인터렉션 애니메이션이 가능한지 확인하는 Delegate
// nil을 리턴하면 인터렉션이 없는 애니메이션이라고 판단한다.
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

@end
