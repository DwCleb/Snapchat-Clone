//
//  PhotoViewController.swift
//  Snapchat Clone
//
//  Created by Cleber Junior on 05/09/18.
//  Copyright © 2018 Cleber Junior. All rights reserved.
//

import UIKit
import FirebaseStorage

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageDescription: UITextField!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    
    @IBAction func photoLibrary(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        let selectedImage = info[ UIImagePickerControllerOriginalImage ] as! UIImage
        
        image.image = selectedImage
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        self.text.text = nil
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        self.nextButton.isEnabled = false
        self.nextButton.setTitle("Loading...", for: .normal)
        
        let storage = Storage.storage().reference()
        let images = storage.child("images")
        
        //recover image
        if let selectedImage = image.image {
            if let dataImage = UIImageJPEGRepresentation(selectedImage, 1) {
                
                images.child("image.jpg").putData(dataImage, metadata: nil, completion: { (metadata, erro) in
                    
                    if erro == nil {
                        print("Success")
                        self.nextButton.isEnabled = true
                        self.nextButton.setTitle("Next", for: .normal)

                    } else {
                        print((erro?.localizedDescription)!)
                    }
                })
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        takePhoto("photo")
        

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
