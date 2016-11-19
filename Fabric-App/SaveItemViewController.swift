//
//  SaveItemViewController.swift
//  Fabric-App
//
//  Created by zeus medina on 11/10/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import CoreData

class SaveItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var itemPhotoView: UIImageView!
    @IBOutlet weak var storeNameField: AkiraTextField!
    @IBOutlet weak var itemTypeField: AkiraTextField!
    @IBOutlet weak var itemPriceField: AkiraTextField!
    @IBOutlet weak var saveItem: UIButton!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var cameraRollButton: UIButton!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SaveItemViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
            
        storeNameField.delegate = self
        itemTypeField.delegate = self
        itemPriceField.delegate = self
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        //Due to running in the simulator, the camera function is not available
        if (UIImagePickerController.isSourceTypeAvailable(.camera) == false) {
            takePhotoButton.isEnabled = false
        }
        //Ensures photo library is accessible, will remove upload functionality otherwise
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == false) {
            cameraRollButton.isEnabled = false
        }

    }
    
    func showImagePickerController() {
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func onCameraRollButton(_ sender: Any) {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        showImagePickerController()
    }
    
    @IBAction func onTakePhotoButton(_ sender: Any) {
        imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
        showImagePickerController()
    }
    
    @IBAction func onSaveItemButton(_ sender: Any) {
        saveToCoreData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        // Dismiss modal controller
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveToCoreData() {
        let dataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let ent = NSEntityDescription.entity(forEntityName: "FabricEntity", in: dataContext)
        let newItem = FabricEntity(entity: ent!, insertInto: dataContext)
        let imageData = UIImagePNGRepresentation(itemPhotoView.image!)
        newItem.itemPhoto = imageData as NSData?
        newItem.itemName = itemTypeField.text!
        newItem.itemPrice = itemPriceField.text!
        newItem.storeName = storeNameField.text!
        
        do {
            try dataContext.save()
        } catch _ {
            print("Error in saving context")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Set preview of image
        itemPhotoView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
