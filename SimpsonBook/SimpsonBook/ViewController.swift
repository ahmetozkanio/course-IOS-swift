//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ahmet Ozkan on 15.09.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    
    
    var simpsonArray = [Simpson]()
    var chosenSimpson: Simpson?
    override func viewDidLoad() {
        super.viewDidLoad() 
        
        tableView.dataSource = self
        tableView.delegate = self
        
        simpsonArray = [Simpson(nameSimpson:"homer",jobSimpson:"homer's job",imageSimpson:UIImage(named: "homer")!),
                        Simpson(nameSimpson:"bart",jobSimpson:"bart's job",imageSimpson:UIImage(named: "bart")!),
                        Simpson(nameSimpson:"lisa",jobSimpson:"lisa's job",imageSimpson:UIImage(named: "lisa")!),
                        Simpson(nameSimpson:"maggie",jobSimpson:"maggie's job",imageSimpson:UIImage(named: "maggie")!),
                        Simpson(nameSimpson:"marge",jobSimpson:"marge's job",imageSimpson:UIImage(named: "marge")!)]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC?.simpsonModel = chosenSimpson
        }
    }
}

