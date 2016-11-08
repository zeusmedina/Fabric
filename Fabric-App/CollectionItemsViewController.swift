//
//  CollectionItemsViewController.swift
//  Fabric-App
//
//  Created by zeus medina on 11/6/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class CollectionItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let imageArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named:"3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FabricItemCollectionCell", for: indexPath) as! FabricItemCollectionCell
        
        cell.fabricItemImage?.image = self.imageArray[indexPath.row]
        cell.fabricItemStoreLabel?.text = "Banana Republic"
        cell.fabricItemNameLabel?.text = "Blue Chinos"
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
