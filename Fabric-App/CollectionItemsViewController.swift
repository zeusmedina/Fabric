//
//  CollectionItemsViewController.swift
//  Fabric-App
//
//  Created by zeus medina on 11/6/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import CoreData

class CollectionItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let imageArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named:"3")]
    
    let fabricDataContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    var fabricList = [FabricEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView.reloadData()
    }
    
    func fetchFabricItems() -> Int {
        let fetchRequest: NSFetchRequest<FabricEntity> = FabricEntity.fetchRequest()
        var size = 0
        do {
            fabricList = try fabricDataContext.fetch(fetchRequest)
            size = fabricList.count
            
        } catch {
            print("Error in fetching core data within CollectionViewController")
        }
        fabricList.reverse()
        return size
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchFabricItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FabricItemCollectionCell", for: indexPath) as! FabricItemCollectionCell
        
        let photo = UIImage(data: fabricList[indexPath.row].itemPhoto as! Data)
        
        cell.fabricItemImage?.image = photo
        cell.fabricItemStoreLabel?.text = fabricList[indexPath.row].storeName
        cell.fabricItemNameLabel?.text = fabricList[indexPath.row].itemName
        cell.fabricItemPriceLabel?.text = fabricList[indexPath.row].itemPrice
        return cell
    }
    
    
    // UICollectionViewDelegateFlowLayout Functions that set up the cell user interface
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = self.view.bounds
        let SCREEN_WIDTH = bounds.size.width
        let itemSize = CGSize(width: SCREEN_WIDTH - 20, height: (SCREEN_WIDTH - 20) * 0.65)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
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
