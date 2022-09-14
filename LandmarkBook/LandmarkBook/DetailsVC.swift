//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Ahmet Ozkan on 15.09.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkName: UILabel!
    @IBOutlet weak var landmarkImage: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkName.text = selectedLandmarkName
        landmarkImage.image = selectedLandmarkImage
        
    }
    

 
}
