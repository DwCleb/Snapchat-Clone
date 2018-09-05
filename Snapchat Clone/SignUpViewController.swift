//
//  SignUpViewController.swift
//  Snapchat Clone
//
//  Created by Cleber Junior on 04/09/18.
//  Copyright © 2018 Cleber Junior. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
   
    @IBOutlet weak var SUemail: UITextField!
    @IBOutlet weak var SUpassword: UITextField!
    @IBOutlet weak var SUconfirmPassword: UITextField!
    
    func showMessage(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        alert.addAction( close )
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
   
        
        //get input values
        if let email = self.SUemail.text {
            if let password = self.SUpassword.text {
                if let confirmPassword = self.SUconfirmPassword.text {
                 
                    //authenticate password
                    if password == confirmPassword {
                       
                        //create account in Firebase
                        let authenticate = Auth.auth()
                        authenticate.createUser(withEmail: email, password: password, completion: {(user, erro) in
                            
                            if erro == nil {
                                
                                if user == nil {
                                    self.showMessage(title: "Ops...", message: "We had a problem. Try again, please.")
                                } else {
                                    
                                    self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
                                }
                               
                            } else {
                                self.showMessage(title: "Ops...", message: (erro?.localizedDescription)!)
                                
                            }
                        })
                    } else {
                        self.showMessage(title: "Ops...", message: "Well, your password don't match with your confirm password")
                        
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
