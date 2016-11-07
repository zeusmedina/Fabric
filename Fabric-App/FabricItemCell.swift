//
//  FabricItemCell.swift
//  Fabric-App
//
//  Created by zeus medina on 10/17/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class FabricItemCell: UITableViewCell {
    
    var fabricObject: String! {
        didSet {
            self.updateUI()
        }
    }
    
    @IBOutlet weak var fabricPhoto: UIImageView!
    @IBOutlet weak var fabricNameLabel: UILabel!
    @IBOutlet weak var fabricStoreLabel: UILabel!
    @IBOutlet weak var fabricPriceLabel: UILabel!
    
    func updateUI() {
        fabricPhoto.image = UIImage(named:"fashion")
        fabricNameLabel.text = "Dad Shoes"
        fabricStoreLabel.text = "Banana Republic"
        fabricPriceLabel.text = "$100"
    }
}
