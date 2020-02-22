//
//  ViewController.swift
//  thingy
//
//  Created by Ryo on 2020/02/01.       
//  Copyright © 2020 Ryo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , UITextFieldDelegate {
    var searchKey: String!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Map: MKMapView!
//    var request:
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        print(searchKey)
        
        
        
        
//        // Do any additional setup after loading the view.
//            let geocoder = CLGeocoder()
//                geocoder.geocodeAddressString(searchKey, completionHandler: { (placemarks, error) in
//
//                    print(placemarks)
//                    if let unwrapPlacemarks = placemarks {
//                        if let firstPlacemark = unwrapPlacemarks.first {
//                            if let location = firstPlacemark.location {
//                                let targetCoordinate = location.coordinate
//                                print(targetCoordinate)
//
//                                let pin = MKPointAnnotation()
//
//                                pin.coordinate = targetCoordinate
//                                pin.title = self.searchKey
//                                self.Map.addAnnotation(pin)
//
//                                self.Map.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
//                            }
//                        }
//                    }
//                })
        }


}



