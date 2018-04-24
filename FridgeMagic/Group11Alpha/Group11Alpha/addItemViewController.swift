//
//  addItemViewController.swift
//  Group11Alpha
//
//  Created by Kyle Kercher on 4/24/18.
//  Copyright © 2018 Yeeun Choi. All rights reserved.
//

import UIKit
import CoreData

class addItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var Accounts = [NSManagedObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Account")
        
        //
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        if let results = fetchedResults {
            Accounts = results
            print(Accounts)
        } else {
            print("Could not fetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //i dont know how to delete this
    @IBAction func itemNameTextField(_ sender: UITextField) {
    }
    
    //text fields to enter data
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    //save button
    @IBAction func saveItemButton(_ sender: Any) {
        saveItemCoreData(name: nameTextField.text!, expirationDate: expirationDateTextField.text!, quantity: quantityTextField.text!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func saveItemCoreData(name: String, expirationDate:String, quantity:String) {
        print(name)
        print(expirationDate)
        print(quantity)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // load in the current account
        let username = Config.userId()
        var currentAccount: NSManagedObject?
        //assumes the account is in the database. will cause problems if its not
        for account in Accounts {
            if account.value(forKey: "username") as! String == username{
                //set account and break loop
                currentAccount = account
            }
        }
        
        // add the item to the pantry
        // Create the entity we want to save
        let itemEntity =  NSEntityDescription.entity(forEntityName: "Item", in: managedContext)
        
        let item = NSManagedObject(entity: itemEntity!, insertInto:managedContext)
        
        // Set the attribute values
        item.setValue(name, forKey: "name")
        item.setValue(expirationDate, forKey: "expirationDate")
        item.setValue(quantity, forKey: "quantity")
        
        //set the current pantry to the user
        let pantry = currentAccount!.value(forKey: "pantry")
        
        //add the item to the pantry
        item.setValue(pantry, forKey: "pantry")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }

    }

}
