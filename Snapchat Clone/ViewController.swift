//
//  ViewController.swift
//  Snapchat Clone
//
//  Created by Cleber Junior on 04/09/18.
//  Copyright © 2018 Cleber Junior. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let authenticate = Auth.auth()
        authenticate.addStateDidChangeListener { (authenticate, user) in
            if user != nil {
                self.performSegue(withIdentifier: "loggedSegue", sender: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

