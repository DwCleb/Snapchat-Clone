//
//  SnapsViewController.swift
//  Snapchat Clone
//
//  Created by Cleber Junior on 05/09/18.
//  Copyright © 2018 Cleber Junior. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UIViewController {
    
    @IBAction func logout(_ sender: Any) {
        let authenticate = Auth.auth()
        do {
            try authenticate.signOut()
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
        } catch {
            self.showMessage(title: "Ops.." ,message: "Sorry, we had a problem for logout")
        }
    }
    
    func showMessage(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        
        alert.addAction( close )
        present(alert, animated: true, completion: nil)
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
