//
//  DetailViewController.swift
//  Fabric-App
//
//  Created by zeus medina on 11/19/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailViewController: UIViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var fabricObject : FabricEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadMap()
        
    }
    
    func setUI() {
        let photo = UIImage(data: fabricObject.itemPhoto as! Data)
        itemImageView.image = photo
        storeNameLabel?.text = fabricObject.storeName
        itemNameLabel?.text = fabricObject.itemName
        priceLabel?.text = "$\(fabricObject.itemPrice!)"
    }
    
    func loadMap() {
        mapView.mapType = MKMapType.standard
        
        // display the map
        let lonC : CLLocationDegrees = fabricObject.long
        
        let latC : CLLocationDegrees = fabricObject.lat
        
        let coordinates = CLLocationCoordinate2D( latitude: latC, longitude: lonC)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinates, span)
        
        self.mapView.setRegion(region, animated: true)
        
        // add an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = fabricObject.storeName
        annotation.subtitle = fabricObject.itemName
        self.mapView.addAnnotation(annotation)
//        self.mapView.mapType = MKMapType.Standard
    }

    @IBAction func onDeleteButton(_ sender: Any) {
        
        
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
