//
//  PopupPresentationTransition.m
//  ViewControllerPractice
//
//  Created by 김명유 on 2021/01/26.
//

#import "PopupPresentationTransition.h"
#import "PopupViewController.h"

@implementation PopupPresentationTransition

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PopupViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toVC.backgroundView.backgroundColor = UIColor.darkGrayColor;
    toVC.backgroundView.alpha = 0.0;
    toVC.backgroundView.frame = UIScreen.mainScreen.bounds;
    
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toVC.backgroundView];
    [containerView addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake(0,
                                 toVC.view.frame.size.height,
                                 toVC.view.frame.size.width,
                                 toVC.view.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
        toVC.backgroundView.alpha = 0.7;
        toVC.view.frame = CGRectMake(0,
                                     0,
                                     toVC.view.frame.size.width,
                                     toVC.view.frame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
