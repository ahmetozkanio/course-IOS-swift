//
//  ViewController.swift
//  AlertExample
//
//  Created by Ahmet Ozkan on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButton(_ sender: Any) {
       
        /*
        let alert = UIAlertController(title: "Error", message: "Username Not Found", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
            (UIAlertAction) in print("Button Clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        */
        
        if usernameTextField.text == ""{
            alert(title: "Error", message: "Username not found")
        }else if passwordTextField.text == ""{
           alert(title: "Error", message: "Password not found")
        }else if passwordTextField.text != passwordAgainTextField.text{
           alert(title: "Error", message: "Password do not match")
        }else{
          alert(title: "Success", message: "User Ok")
        }
    }
    
    func alert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default,handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

