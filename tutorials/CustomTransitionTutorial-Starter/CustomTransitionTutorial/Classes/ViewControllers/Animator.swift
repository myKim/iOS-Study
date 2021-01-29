//
//  Animator.swift
//  CustomTransitionTutorial
//
//  Created by Tung on 27.11.19.
//  Copyright © 2019 Tung. All rights reserved.
//

import UIKit

// Block2 - 8
// Animator는 presenting, dismissing 커스텀 애니메이션이 구현될 클래스이다.
// 이 클래스는 UIViewControllerAnimatedTransitioning 프로토콜을 채택해야 한다.
// 이 프로토콜은 FirstViewController+TransitioningDelegate의 메서드가 리턴해야 할 객체와 같은 타입이다.
final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // Block2 - 9
    // 애니메이션 구현에 필요한 변수들을 선언한다.
    static let duration: TimeInterval = 1.25
    
    private let type: PresentationType
    private let firstViewController: FirstViewController
    private let secondViewController: SecondViewController
    private let selectedCellImageViewSnapshot: UIView
    private let cellImageViewRect: CGRect
    
    // Block2 - 10
    // Animator 초기화 메서드를 구현한다.
    // 초기화 실패 시 nil을 리턴하도록 해서 초기화가 잘못된 경우에 기본 트랜지션을 사용하도록 한다.
    init?(type: PresentationType, firstViewController: FirstViewController, secondViewController: SecondViewController, selectedCellImageViewSnapshot: UIView) {
        self.type = type
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        self.selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        
        guard let window = firstViewController.view.window ?? secondViewController.view.window, let selectedCell = firstViewController.selectedCell else {
            return nil
        }
        
        // Block2 - 11
        // window에서 선택된 셀의 상대 위치를 구한다.
        // 이 변수는 트랜지션 Container View 에서 애니메이션을 구현할 때 필요하다.
        self.cellImageViewRect = selectedCell.locationImageView.convert(selectedCell.locationImageView.bounds, to: window)
    }
    
    
    // Block2 - 12
    // UIViewControllerAnimatedTransitioning의 필수 메서드
    // 트랜지션 시간을 리턴한다.
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    // Block2 - 13
    // UIViewControllerAnimatedTransitioning의 필수 메서드
    // 실제 애니메이션을 여기에 구현한다.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Block2 - 18
        // containerView는 transition에서 제공하는 객체이다.
        // 커스텀으로 구현할 애니메이션이 실행되기 위해 사용할 뷰라고 생각하면 된다.
        // 기본적으로 이것은 애니메이션을 보여주기 위해 FirstViewController와 SecondViewController 사이에 붙어있는 뷰이다.
        let containerView = transitionContext.containerView
        
        // Block2 - 19
        // SecondViewController를 표시(present)하기 위해서 containerView에 view를 addSubview 해야한다.
        // 실패할 경우 completeTransaction(false)를 호출해서 트랜지션이 발생하지 않을 것을 알린다.
        guard let toView = secondViewController.view else {
            transitionContext.completeTransition(false)
            return
        }
        containerView.addSubview(toView)
        
        // Block2 - 20
        // completeTransition 메서드를 호출해 transitionContext에 트랜지션이 끝났음을 알린다.
        // 호출하지 않으면 트랜지션 중인 것으로 인식되어 인터렉션이 불가능하다.
        transitionContext.completeTransition(true)
    }
}

// Block2 - 14
// present, dismiss 구분하는 Enum
enum PresentationType {
    case present
    case dismiss
    
    var isPresenting: Bool {
        return self == .present
    }
}
