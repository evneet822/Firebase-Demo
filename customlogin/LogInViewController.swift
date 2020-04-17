//
//  LogInViewController.swift
//  customlogin
//
//  Created by Evneet kaur on 2020-04-16.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var usernametxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var loginbuttton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loginaction(_ sender: Any) {
        
        let uname = usernametxt.text
        let pass = passwordtxt.text
        
        Auth.auth().signIn(withEmail: uname!, password: pass!) { (result, error) in
            if error != nil{

                print("error//////////////////")
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as? WelcomeVC

                self.view.window?.rootViewController = vc
                self.view.window?.makeKeyAndVisible()
            }
        }
        
        
    }
    
}
