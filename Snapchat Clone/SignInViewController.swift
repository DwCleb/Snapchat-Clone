//
//  SignInViewController.swift
//  Snapchat Clone
//
//  Created by Cleber Junior on 04/09/18.
//  Copyright © 2018 Cleber Junior. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var SIemail: UITextField!
    @IBOutlet weak var SIpassword: UITextField!
    
    
    func showMessage(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        alert.addAction( close )
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: Any) {
        // get input values
        if let email = self.SIemail.text {
            if let password = self.SIpassword.text {
                
                //authenticate
                let authenticate = Auth.auth()
                authenticate.signIn(withEmail: email, password: password, completion: {(user, erro) in
                    
                    if erro == nil {
                        
                        if user == nil {
                            self.showMessage(title: "Ops...", message: "Check your e-mail and password and try again, please.")
                        } else {
                            //signIn
                            self.performSegue(withIdentifier: "SignInSegue", sender: nil)
                        }
                        
                        
                    } else {
                        //erro in signIn
                        self.showMessage(title: "Ops...", message: (erro?.localizedDescription)!)
                        
                    }
                })
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
