//
//  SignUpViewController.swift
//  customlogin
//
//  Created by Evneet kaur on 2020-04-16.
//  Copyright © 2020 Evneet kaur. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var fnametxtfeild: UITextField!
    @IBOutlet weak var lnametxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwoedtxt: UITextField!
    @IBOutlet weak var signupbutton: UIButton!
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
    
    @IBAction func signupaction(_ sender: UIButton) {
        
        let fname = fnametxtfeild.text
        let lname = lnametxt.text
        let email = emailtxt.text
        let password = emailtxt.text
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
            if err != nil{
                print("//////////error")
            }else{
                let db = Firestore.firestore()
                db.collection("users").addDocument(data: ["firstname": fname!,"lastname": lname!,"uid":result!.user.uid]) { (error) in
                    print("///////////////")

                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as? WelcomeVC

                    self.view.window?.rootViewController = vc
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    
}
