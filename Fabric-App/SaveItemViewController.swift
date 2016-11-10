//
//  SaveItemViewController.swift
//  Fabric-App
//
//  Created by zeus medina on 11/10/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class SaveItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var storeNameField: AkiraTextField!
    @IBOutlet weak var itemTypeField: AkiraTextField!
    @IBOutlet weak var itemPriceField: AkiraTextField!
    @IBOutlet weak var saveItem: UIButton!
    
     let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func onCameraRollButton(_ sender: Any) {
        
    }
    
    @IBAction func onTakePhotoButton(_ sender: Any) {
        
    }
    
    @IBAction func onSaveItemButton(_ sender: Any) {
        // Save fabric item data to Core Data
        
        // Return to collection view
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        // Dismiss modal controller
    }
    

}
