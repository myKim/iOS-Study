//
//  FirstViewController+CollectionView.swift
//  CustomTransitionTutorial
//
//  Created by Tung on 27.11.19.
//  Copyright © 2019 Tung. All rights reserved.
//

import UIKit

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellIdentifier", for: indexPath) as! CollectionViewCell
        cell.configure(with: DataManager.data[indexPath.row])
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Block2 - 6
        // 셀을 탭하면 선택된 셀을 저장한다.
        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        // Block2 - 7
        // 선택된 셀의 스냅샷을 저장한다.
        selectedCellImageViewSnapshot = selectedCell?.snapshotView(afterScreenUpdates: false)

        presentSecondViewController(with: DataManager.data[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - Constants.cellSpacing) / 2
        return .init(width: width, height: width)
    }
}
