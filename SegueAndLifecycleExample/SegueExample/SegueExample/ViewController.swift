//
//  ViewController.swift
//  SegueExample
//
//  Created by Ahmet Ozkan on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad is called")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear is called")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear is called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear is called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear is called")
    }

    @IBAction func nextButton(_ sender: Any) {
       // performSegue(withIdentifier: "nextSegue", sender: nil)
    }
    
    @IBAction func gotTo2ndButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextSegue"{
           let destinationVC = segue.destination as? SecondViewController
            destinationVC?.name = textField.text!
        }
    }
}

