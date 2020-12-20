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
    lazy var gameImages: [UIImage] = images.shuffled()
    
 
    @IBOutlet weak var collectionOutlet: UICollectionView!
    
    @IBOutlet weak var gameOutlet: UICollectionView!
    
    override func viewDidLoad() {
        
        collectionOutlet.dataSource = self
        
        collectionOutlet.collectionViewLayout = GridyLayout()
        
        gameOutlet.collectionViewLayout = GridyLayout()
        
        gameOutlet.dataSource = self
        
        print(images)
        print(gameImages)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionOutlet {
            return images.count
        }
        return 0
    }
    // 12/13 create another array (gameImages) make this array equal to images.shuffled. Modify func to display game images count for gameOutlet, modify line 42 collectionView func.
    
    func gameView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if gameView == gameOutlet {
            return gameImages.count
        }
        return 0
    }
    
    func gameView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
           
           let photo = images[indexPath.row]
           
           let imageView = UIImageView(frame: cell.bounds)
           
           imageView.image = photo
           
           cell.contentView.addSubview(imageView)
           
           
           
           
           return cell
           
           

       
           
       }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        
        let photo = images[indexPath.row]
        
        let imageView = UIImageView(frame: cell.bounds)
        
        imageView.image = photo
        
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
