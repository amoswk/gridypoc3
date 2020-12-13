//
//  DetailViewController.swift
//  gridypoc2
//
//  Created by Amos on 11/22/20.
//  Copyright © 2020 Amos Katz. All rights reserved.
//

import UIKit

var image:UIImage = UIImage()

class DetailViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myImage.image = image
        
    }
    



}
