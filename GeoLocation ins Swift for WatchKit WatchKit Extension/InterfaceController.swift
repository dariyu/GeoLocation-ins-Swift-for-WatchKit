//
//  InterfaceController.swift
//  GeoLocation ins Swift for WatchKit WatchKit Extension
//
//  Created by Патутинский Федор on 31.01.15.
//  Copyright (c) 2015 BitFountain. All rights reserved.
//

import WatchKit;
import Foundation;
import CoreLocation;

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lblLocationDisplay: WKInterfaceLabel!;
    
    let locationManager = CLLocationManager();

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func btnFindLocation() {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error) -> Void in
            println("Something");
                let placeMarks = placemarks[0] as CLPlacemark;
                self.displayLocation(placeMarks);
            
        });
    }
    
    func displayLocation(placemark: CLPlacemark) {
//        locationManager.stopUpdatingLocation();
        println(placemark.country);
        let locality = placemark.locality;
        let postalCode = placemark.postalCode;
        let administrativeArea = placemark.administrativeArea;
        let country = placemark.country;
        
        lblLocationDisplay.setText("Locality: \(locality) PostalCode: \(postalCode) Area: \(administrativeArea) Country: \(country)");
    }
}
