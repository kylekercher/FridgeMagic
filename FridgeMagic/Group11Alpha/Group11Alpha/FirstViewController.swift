//
//  FirstViewController.swift
//  Group11Alpha
//
//  Created by Yeeun Choi on 2018. 4. 10..
//  Copyright © 2018년 Yeeun Choi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var UserPic: UIImageView!
    @IBOutlet weak var HelloChef: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBAction func LikedRecipe(_ sender: Any) {
    }
    @IBAction func MyRecipe(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
