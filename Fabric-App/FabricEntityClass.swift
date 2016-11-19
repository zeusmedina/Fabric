//
//  FabricEntity.swift
//  Fabric-App
//
//  Created by zeus medina on 11/10/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import Foundation
import CoreData

class FabricEntityClass: NSManagedObject {
    @NSManaged var itemName: String?
    @NSManaged var itemPrice: String?
    @NSManaged var storeName: String?
    @NSManaged var itemPhoto: Data?
}
