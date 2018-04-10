//
//  registerViewController.swift
//  Group11Alpha
//
//  Created by Choi, In Kyoung on 4/10/18.
//  Copyright © 2018 Yeeun Choi. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {
    
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        // Display alert message with confirmation
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

}
