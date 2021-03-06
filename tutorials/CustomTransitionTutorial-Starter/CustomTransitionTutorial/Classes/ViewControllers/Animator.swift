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
    private var selectedCellImageViewSnapshot: UIView
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
        // deleted line: transitionContext.completeTransition(true)
        
        // Block3 - 21
        //  - selectedCell : 선택된 셀
        //  - window : presenting이면 FirstViewController의 윈도우, dismissing이면 SecondViewController의 윈도우
        //  - cellImageSnapShot : 선택된 셀 이미지뷰의 스냅샷
        //  - controllerImageSnapshot : SecondViewController 이미지뷰의 스냅샷
        guard let selectedCell = firstViewController.selectedCell,
              let window = firstViewController.view.window ?? secondViewController.view.window,
              let cellImageSnapshot = selectedCell.locationImageView.snapshotView(afterScreenUpdates: true),
              let controllerImageSnapshot = secondViewController.locationImageView.snapshotView(afterScreenUpdates: true) else {
            transitionContext.completeTransition(true)
            return
        }
        
        let isPresenting = type.isPresenting
        
        // Block3 - 22 - deleted Step (Block4)
        // Block4 - 33
        // presenting일 때 selectedCellImageViewSnapshot에 cellImageSnapshot을 할당한다.
        // 이는 selectedCellImageViewSnapshot 스냅샷을 찍는 순간에 뷰가 아직 업데이트 되지 않는 이슈를 위한 해결 방법이다.
        if isPresenting {
            selectedCellImageViewSnapshot = cellImageSnapshot
        }
        
        // Block3 - 23
        // 보여지는(presented) 뷰는 투명해야 한다.
        // 만약 그렇지 않으면 이것은 애니메이션 뷰를 덮어버린다.
        toView.alpha = 0
        
        // Block3 - 24 - deleted Step (Block4)
        // Block4 - 34
        // 선택된 셀과 SecondViewController의 이미지뷰 둘 다 containerView에 추가한다.
        [selectedCellImageViewSnapshot, controllerImageSnapshot].forEach {
            containerView.addSubview($0)
        }
        
        // Block3 - 25
        // SecondViewController의 이미지뷰의 frame을 얻는다.
        // 이 위치정보를 셀의 frame부터의 트랜지션을 만드는데 사용한다.
        let controllerImageViewRect = secondViewController.locationImageView.convert(secondViewController.locationImageView.bounds, to: window)
        
        // Block3 - 26 - deleted Step (Block4)
        // Block4 - 35
        // 선택된 셀과 SecondViewController의 이미지뷰 둘 다 초기 frame을 설정한다.
        [selectedCellImageViewSnapshot, controllerImageSnapshot].forEach {
            $0.frame = isPresenting ? cellImageViewRect : controllerImageViewRect
        }
        
        // Block4 - 36
        // SecondViewController의 이미지뷰 스냅샷을 presenting이면 투명한 상태로 설정한다.
        // dismissing의 경우 반대로 설정한다.
        controllerImageSnapshot.alpha = isPresenting ? 0 : 1
        
        // Block4 - 37
        // 선택된 셀의 이미지뷰 스냅샷을 presenting이면 반투명한 상태로 설정한다.
        // dismissing의 경우 반대로 설정한다.
        selectedCellImageViewSnapshot.alpha = isPresenting ? 1 : 0
        
        // Block3 - 27
        // 애니메이션을 구현한다.
        // UIView.animate로 구현하지 않고 UIView.animateKeyframes로 구현하는 이유는 이후에 다른 시점, 다른 기간의 애니메이션들을 더 추가하기 위해서이다.
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                // Block3 - 28 - deleted Step (Block4)
                // Block4 - 38
                // 선택된 셀과 SecondViewController의 이미지뷰를 트랜지션 후의 위치로 설정한다.
                self.selectedCellImageViewSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
                controllerImageSnapshot.frame = isPresenting ? controllerImageViewRect : self.cellImageViewRect
            }
            
            // Block4 - 39
            // 선택된 셀과 SecondViewController의 투명도를 동시에 변경한다.
            // 기간을 0.6으로 두면 자연스럽다.
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6) {
                self.selectedCellImageViewSnapshot.alpha = isPresenting ? 0 : 1
                controllerImageSnapshot.alpha = isPresenting ? 1 : 0
            }
        }, completion: { _ in
            // Block3 - 29 - deleted Step (Block4)
            // Block4 - 39.1
            // 트랜지션에 사용한 하위 뷰들을 모두 제거한다.
            self.selectedCellImageViewSnapshot.removeFromSuperview()
            controllerImageSnapshot.removeFromSuperview()
            
            // Block3 - 30
            // 애니메이션 시작 전 투명으로 설정해주었던 toView를 불투명하게 변경해준다.
            toView.alpha = 1
            
            // Block3 - 31
            // 트랜지션을 complete한다.
            transitionContext.completeTransition(true)
        })
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
