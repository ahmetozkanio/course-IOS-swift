//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by Ahmet Ozkan on 11.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name =  UserDefaults.standard.object(forKey: "name")
        let birthday =  UserDefaults.standard.object(forKey: "birthday")
      
        if let myName = name as? String{
            nameLabel.text = myName
        }
        if let myBirthday = birthday as? String {
            birthdayLabel.text = myBirthday
        }
        
        
    }


    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")

        nameLabel.text = "name : " + (nameTextField?.text)!
        birthdayLabel.text = "birthday : " + (birthdayTextField?.text)!

    }
}

