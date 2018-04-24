//
//  registerViewController.swift
//  Group11Alpha
//
//  Created by Choi, In Kyoung on 4/10/18.
//  Copyright © 2018 Yeeun Choi. All rights reserved.
//

import UIKit
import CoreData

class registerViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

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
    @IBAction func registerButtonTapped(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        // check for empty
        if (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userRepeatPassword?.isEmpty)! {
            // display alert message
            displayMyAlertMessage(userMessage: "All fields are required")
            
        }
        if userPassword != userRepeatPassword {
            displayMyAlertMessage (userMessage: "Passwords do not match")
        }
        
        //Store Data
        Config.setUserId(userEmailTextField.text!)
        Config.setPassword(userPasswordTextField.text!)
        saveAccountCoreData(username: userEmailTextField.text!, password: userPasswordTextField.text!)
        
        // Display alert message with confirmation and send back to login page
        self.performSegue(withIdentifier: "RegisterToLogin", sender: self)
        displayMyAlertMessage(userMessage: "Registration is successful. Thank you!")
    }
    
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController (title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction (title: "OK", style: UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion: nil)
    }
    
    // Control the Keyboards Operations
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func saveAccountCoreData(username: String, password:String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        // Create the entity we want to save
        let accountEntity =  NSEntityDescription.entity(forEntityName: "Account", in: managedContext)
        
        let account = NSManagedObject(entity: accountEntity!, insertInto:managedContext)
        
        // Set the attribute values
        account.setValue(username, forKey: "username")
        account.setValue(password, forKey: "password")
        
        // Commit the changes.
        do {
            try managedContext.save()
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        //make the pantry and recipe book
        let pantryEntity =  NSEntityDescription.entity(forEntityName: "Pantry", in: managedContext)
        let recipeBookEntity =  NSEntityDescription.entity(forEntityName: "RecipeBook", in: managedContext)
        
        let pantry = NSManagedObject(entity: pantryEntity!, insertInto:managedContext)
        let recipeBook = NSManagedObject(entity: recipeBookEntity!, insertInto:managedContext)
        
        //set the pantry to the person and keep it empty
        account.setValue(pantry, forKey: "pantry")
        account.setValue(recipeBook, forKey: "recipeBook")
        
        // Add the new entity to our array of managed objects
        Accounts.append(account)
    }

}
