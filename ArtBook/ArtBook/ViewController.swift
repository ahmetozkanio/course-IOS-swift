//
//  ViewController.swift
//  ArtBook
//
//  Created by Ahmet Ozkan on 15.09.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    
    var selectedPainting = ""
    var selectedPaintingId: UUID?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        
        getCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool){
        // diger taraftan ekledigimizi buraya bildirip getCoreData yi tekrar cagiriyoruz.
        NotificationCenter.default.addObserver(self, selector: #selector(getCoreData), name: NSNotification.Name(rawValue: "newData"), object: nil)
        
        
    }
    
        //core data daki verilerimizi burada cekiyoruz
    @objc func getCoreData(){
        
        // Yeniden cekme isleminde arrayi sifirlariz.
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        fetchRequest.returnsObjectsAsFaults = false
        
       do{
           if context != nil {
            let results = try context!.fetch(fetchRequest)

           
               if results.count > 0{
           for result in results as! [NSManagedObject]{
               if let name = result.value(forKey: "name") as? String{
                   self.nameArray.append(name)
               }
               if let id = result.value(forKey: "id") as? UUID {
                   self.idArray.append(id)
               }
               
               // Table View refresh islemi
               self.tableView.reloadData()
           }
               }
               
           }
        } catch {
            print("Error")
        }
        
    }
    
    @objc func addButtonClicked(){
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)//rooting islemi
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    
    //Diger tarafa verileri aktarma islemi
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{// buradaki silem eger rooting islemi olursa calisir
            let destinationVC = segue.destination as? DetailsViewController
            
            destinationVC?.chosenPainting = selectedPainting
            destinationVC?.chosenPatintingId = selectedPaintingId
          
            
        }
    }
    
    //tableView e tiklaninca indexi alip ne yapmak istedigimiz fonksiyon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)//rooting islemi
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchReguest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = idArray[indexPath.row].uuidString
            fetchReguest.predicate = NSPredicate(format: "id = %@", idString)
            fetchReguest.returnsObjectsAsFaults = false
            
            do{
                let	results = try context.fetch(fetchReguest)
                if results.count > 0{
                    for result in results as! [NSManagedObject] {
                        if let id = result.value(forKey: "id") as? UUID{
                            if id == idArray[indexPath.row]{
                                context.delete(result)
                                nameArray.remove(at: indexPath.row)
                                idArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do{
                                    try context.save()
                                }catch{
                                }
                                
                                break
                                
                            }
                        }
                    }
                }
            }catch{
                
            }
        }
    }
}
