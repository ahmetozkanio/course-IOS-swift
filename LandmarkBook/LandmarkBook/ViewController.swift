//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ahmet Ozkan on 14.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
  
        landmarkNames.append("Colesseum")
        landmarkNames.append("Sidney")
        landmarkNames.append("Eiffel")
        landmarkNames.append("London Bridge")
        landmarkNames.append("Pisa")
        

        landmarkImages.append(UIImage(named: "colesseum.jpeg")!)
        landmarkImages.append(UIImage(named: "sidney.jpeg")!)
        landmarkImages.append(UIImage(named: "eiffel.jpeg")!)
        landmarkImages.append(UIImage(named: "londonBridge.jpeg")!)
        landmarkImages.append(UIImage(named: "pisa.jpeg")!)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]

        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
        
    }
}

