//
//  GridyCell.swift
//  gridypoc2
//
//  Created by Amos on 11/29/20.
//  Copyright © 2020 Amos Katz. All rights reserved.
//

import Foundation
import UIKit

class GridyLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.width
        let maxNumColumns = 5
        let cellWidth = (availableWidth / CGFloat(maxNumColumns))
        let cellHeight = cellWidth
        
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        self.minimumInteritemSpacing = 5
        self.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
        self.minimumLineSpacing = 2
        
        
        
        
    }
    

    
    
    //setup collection view for top area of gridy based on remaining screen space. will need one extra cell for "eye" image. 11/29
}

class GameLayout: UICollectionViewFlowLayout {
    
     //define separate flow layout for bottom collection view 12/7
    
    override func prepare() {
          
          super.prepare()
          
          guard let collectionView = collectionView else { return }
          
          let availableWidth = collectionView.bounds.width
          let maxNumColumns = 5
          let cellWidth = (availableWidth / CGFloat(maxNumColumns))
          let cellHeight = cellWidth
          
          self.itemSize = CGSize(width: cellWidth, height: cellHeight)
          self.minimumInteritemSpacing = 5
          self.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
          self.sectionInsetReference = .fromSafeArea
          self.minimumLineSpacing = 2
          
    
    
    
    
}

}
