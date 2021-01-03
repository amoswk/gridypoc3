//
//  imagearray.swift
//  gridypoc2
//
//  Created by Amos on 11/22/20.
//  Copyright © 2020 Amos Katz. All rights reserved.
//

// 12/20 search apple documentation for an array that can be initialized by a repeating value. add an extra image to assets for use. Fix autolayout/line spacing issue to display all images. top collectionview should be rectangle, bottom collectionview is a square.


import Foundation
import UIKit

class ArrayDisplay: UIViewController, UICollectionViewDataSource {
    
    var images: [UIImage] = []
    var gameImages: [UIImage] = []
    let arrayNumbers = [Int](repeating: 1, count: 16)
    
    
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    @IBOutlet weak var gameOutlet: UICollectionView!
    
    override func viewDidLoad() {
        
        collectionOutlet.dataSource = self
        
        collectionOutlet.collectionViewLayout = GridyLayout()
        
        gameOutlet.collectionViewLayout = GridyLayout()
        
        gameOutlet.dataSource = self
        
        gameImages = images.shuffled()
        
        print(images)
        print(gameImages)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionOutlet {
            return images.count
        }
        
        if collectionView == gameOutlet {
            
            return gameImages.count
            
        }
        
        return 0
    }
    // 12/13 create another array (gameImages) make this array equal to images.shuffled. Modify func to display game images count for gameOutlet, modify line 42 collectionView func.
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        
        let imageView = UIImageView(frame: cell.bounds)
        
        
        
        if collectionView == collectionOutlet {
            
            let photo = images[indexPath.row]
            
            imageView.image = photo
            
        }
        
        if collectionView == gameOutlet {
            
            let photo = gameImages[indexPath.row]
            
            imageView.image = photo
            
        }
        
        
        
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
