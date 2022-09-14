//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Ahmet Ozkan on 14.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
  
    var isPolatPic = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.isUserInteractionEnabled = true // kullanici imageView e tiklanabilir ozelligi
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePicture(){
        
        
        if isPolatPic == false {
            imageView.image = UIImage(named: "alemdar")
            nameLabel.text = "alemdar"
            isPolatPic = false
        }else{
            imageView.image = UIImage(named: "polat")
        
            nameLabel.text = "polat"
            isPolatPic = false
        
        }
    }

}

