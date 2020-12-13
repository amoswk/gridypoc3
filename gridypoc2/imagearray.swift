//
//  imagearray.swift
//  gridypoc2
//
//  Created by Amos on 11/22/20.
//  Copyright © 2020 Amos Katz. All rights reserved.
//

import Foundation
import UIKit

class ArrayDisplay: UIViewController, UICollectionViewDataSource {
    
    var images: [UIImage] = []
    
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    
    override func viewDidLoad() {
        
        collectionOutlet.dataSource = self
        
        collectionOutlet.collectionViewLayout = GridyLayout()
        
        print(images)
        
    }
    
    
    //  UICollectionViewCell {
    //
    //        static let reuseIdentifier = String(describing: NumberCellCollectionViewCell.self)
    //
    //        @IBOutlet weak var label: NumberCellCollectionViewCell!
    //    }
    //
    
    //
    //
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        
        let photo = images[indexPath.row]
        
        let imageView = UIImageView(frame: cell.frame)
        
        //3
        imageView.image = photo
        cell.contentView.backgroundColor = [UIColor.yellow, UIColor.red, UIColor.green, UIColor.gray].randomElement()
        cell.contentView.addSubview(imageView)
    
        
      
        
        return cell
        
        
        
        
        
        
        
    }
    
    
    
    // 12/6 get a random picture for the screenshots. Get all cells to show a piece of the screenshot
    
    
}

extension ArrayDisplay: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 70, height: 70)
    }
}
