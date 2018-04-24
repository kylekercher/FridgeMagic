//
//  PantryTableViewController.swift
//  Group11Alpha
//
//  Created by Kyle Kercher on 4/24/18.
//  Copyright © 2018 Yeeun Choi. All rights reserved.
//

import UIKit
import CoreData

class PantryTableViewController: UITableViewController {

    var Accounts = [NSManagedObject]()
    var pantry = NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
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
        } else {
            print("Could not fetch")
        }
        
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
        //thsi is broken and i dont know why
        //needs to be an nsmanagedobject to get the items out of it
        //i think its messed up in the data structure with the relationship
        let _pantry = currentAccount!.value(forKey: "pantry") as! NSManagedObject

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //needs to be the count of items in the pantry
        return 0
    }
    
    //needs to be modified to use the pantry item system
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "candidate", for: indexPath)
        let person = people[indexPath.item]
        // Configure the cell...
        let _lastName = person.value(forKey: "lastName") as? String
        let _firstName = person.value(forKey: "firstName") as? String
        cell.textLabel!.text = "\(_firstName!) \(_lastName!)"
        cell.detailTextLabel!.text = person.value(forKey: "party") as? String
        return cell
    }
 */
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
