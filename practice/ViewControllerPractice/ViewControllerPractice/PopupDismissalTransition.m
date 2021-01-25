//
//  PopupDismissalTransition.m
//  ViewControllerPractice
//
//  Created by 김명유 on 2021/01/26.
//

#import "PopupDismissalTransition.h"
#import "PopupViewController.h"

@implementation PopupDismissalTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    PopupViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
        fromVC.backgroundView.alpha = 0.0;
        fromVC.view.frame = CGRectMake(0,
                                       fromVC.view.frame.size.height,
                                       fromVC.view.frame.size.width,
                                       fromVC.view.frame.size.height);
    } completion:^(BOOL finished) {
        [fromVC.backgroundView removeFromSuperview];
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

@end
