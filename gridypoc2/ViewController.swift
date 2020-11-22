//
//  ViewController.swift
//  gridypoc2
//
//  Created by Amos on 11/22/20.
//  Copyright © 2020 Amos Katz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
let reuseIdentifier = "PhotoCell"
let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
let itemsPerRow: CGFloat = 4
var imageSlices: [UIImage] = []
    
    
    @IBOutlet weak var btnImage: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        btnImage.isHidden = true
        
    }
    

    @IBOutlet weak var btn: NSLayoutConstraint!
    
    @IBAction func btn(_ sender: Any) {
        
        let screenshot = self.view.takeScreenshot()
        
        imageSlices = imageSlice(into: 4, testImage: screenshot)
        
        // detail view controller
        image = imageSlices.first!
        
        
        btnImage.isHidden = false
    }
    
}


func imageSlice(into howManyPieces: Int, testImage: UIImage) -> [UIImage] {
    let width: CGFloat
    let height: CGFloat

    switch testImage.imageOrientation {
    case .left, .leftMirrored, .right, .rightMirrored:
        width = testImage.size.height
        height = testImage.size.width
    default:
        width = testImage.size.width
        height = testImage.size.height
    }

    let tileWidth = Int(width / CGFloat(howManyPieces))
    let tileHeight = Int(height / CGFloat(howManyPieces))

    let scale = Int(testImage.scale)
    var images = [UIImage]()
    let cgImage = testImage.cgImage!

    var adjustedHeight = tileHeight

    var y = 0
    for row in 0 ..< howManyPieces {
        if row == (howManyPieces - 1) {
            adjustedHeight = Int(height) - y
        }
        var adjustedWidth = tileWidth
        var x = 0
        for column in 0 ..< howManyPieces {
            if column == (howManyPieces - 1) {
                adjustedWidth = Int(width) - x
            }
            let origin = CGPoint(x: x * scale, y: y * scale)
            let size = CGSize(width: adjustedWidth * scale, height: adjustedHeight * scale)
            let tileCgImage = cgImage.cropping(to: CGRect(origin: origin, size: size))!
            images.append(UIImage(cgImage: tileCgImage, scale: testImage.scale, orientation: testImage.imageOrientation))
            x += tileWidth
        }
        y += tileHeight
    }
    return images
}



@available(iOS 13.0, *)
func configureLaylout() -> UICollectionViewCompositionalLayout {
       let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.25))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
       let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
       
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       let section = NSCollectionLayoutSection(group: group)
       
       
       return UICollectionViewCompositionalLayout(section: section)
       
       
       

       
   }


extension UIView {
    
    func takeScreenshot() -> UIImage {
        
       
        
        //begin
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // draw view in that context.
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // get iamge
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        
        
        if image != nil {
            return image!
            
            
        }
        
        return UIImage()
        
    }
    
    

    

    
}


class NumberCellCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: NumberCellCollectionViewCell.self)
    
    @IBOutlet weak var label: NumberCellCollectionViewCell!
}

extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView,
                                  numberOfItemsInSection section: Int) -> Int {
        return imageSlices.count
        
     }
     
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //1
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let photo = imageSlices[indexPath.row]
        
        let imageView = UIImageView(frame: cell.frame)
    
           //3
        imageView.image = photo
        
        cell.contentView.addSubview(imageView)
          
        return cell
    
}
//
//extension ViewController : UICollectionViewDelegateFlowLayout {
//  //1
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      sizeForItemAt indexPath: IndexPath) -> CGSize {
//    //2
//    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//    let availableWidth = view.frame.width - paddingSpace
//    let widthPerItem = availableWidth / itemsPerRow
//
//    return CGSize(width: widthPerItem, height: widthPerItem)
//  }
//
//  //3
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      insetForSectionAt section: Int) -> UIEdgeInsets {
//    return sectionInsets
//  }
//
//  // 4
//  func collectionView(_ collectionView: UICollectionView,
//                      layout collectionViewLayout: UICollectionViewLayout,
//                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//    return sectionInsets.left
//  }
//}




// need an additional view controller to contain image array 10/18, use prepareforsegue to pass data/array from viewcontroller



}
