//
//  FirstViewController.swift
//  CustomTransitionDemo
//
//  Created by Tung on 12.10.19.
//  Copyright © 2019 Tung. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    // Block2 - 5
    // 선택된 셀을 저장할 변수와 그 셀의 snapshot할 변수를 선언한다.
    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    // Block2 - 15
    // Animator 변수 선언
    var animator: Animator?
    
    @IBOutlet private var collectionView: UICollectionView!



    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.cellSpacing
        layout.minimumInteritemSpacing = Constants.cellSpacing

        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    func presentSecondViewController(with data: CellData) {
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        // Block1 - 4
        // SecondViewController의 transitioningDelegate를 세팅해준다.
        // nil이면 기본 transition이 사용된다.
        secondViewController.transitioningDelegate = self
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = data
        present(secondViewController, animated: true)
    }
}

extension FirstViewController {

    enum Constants {

        static let cellSpacing: CGFloat = 8
    }
}
