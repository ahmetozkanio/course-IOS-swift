//
//  DetailsViewController.swift
//  SimpsonBook
//
//  Created by Ahmet Ozkan on 15.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var simpsonModel: Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = simpsonModel?.name
        jobLabel.text = simpsonModel?.job
        imageView.image = simpsonModel?.image
    }
    

   

}
