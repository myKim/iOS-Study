//
//  FirstViewController+TransitioningDelegate.swift
//  CustomTransitionTutorial
//
//  Created by Tung on 27.11.19.
//  Copyright © 2019 Tung. All rights reserved.
//

import UIKit

// Block1 - 1
// FirstViewController가  Custom Transition을 구현하는 Delegate가 될 수 있도록 UIViewControllerTransitioningDelegate 프로토콜을 채택한다.
extension FirstViewController: UIViewControllerTransitioningDelegate {
    
    // Block1 - 2
    // Presenting을 위한 Custom Transition 메서드이다.
    // transition 애니메이션이 구현된 객체를 리턴해야 한다.
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    // Block1 - 3
    // Dismissing을 위한 Custom Transaction 메서드이다.
    // transition 애니메이션이 구현된 객체를 리턴해야 한다.
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
}
