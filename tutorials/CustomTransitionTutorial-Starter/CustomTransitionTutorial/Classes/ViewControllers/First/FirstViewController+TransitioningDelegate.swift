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
        
        // Block2 - 16
        // Presenting을 위한 Animator를 생성하고 리턴한다.
        // 생성을 실패할 경우 nil을 리턴해서 기본 트랜지션을 사용하도록 한다.
        guard let firstViewController = presenting as? FirstViewController,
              let secondViewController = presented as? SecondViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot else {
            return nil
        }
        
        animator = Animator(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
    
    // Block1 - 3
    // Dismissing을 위한 Custom Transaction 메서드이다.
    // transition 애니메이션이 구현된 객체를 리턴해야 한다.
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Block2 - 17
        // Dismissing을 위한 Animator를 생성하고 리턴한다.
        // 생성을 실패할 경우 nil을 리턴해서 기본 트랜지션을 사용하도록 한다.
        guard let secondViewController = dismissed as? SecondViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot else {
            return nil
        }
        
        animator = Animator(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
