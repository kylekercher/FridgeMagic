//
//  LoginViewController.swift
//  Group11Alpha
//
//  Created by Yeeun Choi on 2018. 3. 21..
//  Copyright © 2018년 Yeeun Choi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let userEmail = usernameTextField.text
        let userPassword = passwordTextField.text
        let userEmailStored = Config.userId()
        let userPasswordStore = Config.password()
        
        if userEmailStored == userEmail {
            if userPasswordStore == userPassword {
                // Login is successfull
                self.performSegue(withIdentifier: "login", sender: self)
                displayMyAlertMessage(userMessage: "Logged In")
                
                
                
            }
            else{
                displayMyAlertMessage(userMessage: "Password does not match")
            }
        }
        else{
            displayMyAlertMessage(userMessage: "Username does not exist")
        }
        
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


    

}
