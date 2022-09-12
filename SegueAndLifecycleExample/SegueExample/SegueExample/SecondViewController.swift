//
//  SecondViewController.swift
//  SegueExample
//
//  Created by Ahmet Ozkan on 12.09.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myLabelSecond: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
    }
    
  
   

}
