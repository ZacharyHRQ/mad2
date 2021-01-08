//
//  mapViewController.swift
//  Telegramme
//
//  Created by shadow on 2/1/21.
//

import UIKit
import CoreLocation
import MapKit


class mapViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    let locationManager:CLLocationManager = CLLocationManager()
    let regionRadius:CLLocationDistance = 250

    func centerMapOnLocation(location:CLLocation){
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        
        self.centerMapOnLocation(location: locationManager.location!)
        
        //excerise 1
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("535 Clementi Road Singapore 599489") { (p, e) in
            let lat = String(
                format: "Lat: %3.12f", p![0].location!.coordinate.latitude)
            let long = String(
                format: "Long: %3.12f", p![0].location!.coordinate.longitude)
            
            print("\(lat), \(long)")
            
            let location = p![0].location!.coordinate
            
            let annotation = MKPointAnnotation()

            annotation.coordinate = location
            annotation.title = "Ngee Ann Polytechnic"
            annotation.subtitle = "School of ICT"
            self.map.addAnnotation(annotation)
            
            
        }
        
        //excerise 2
        let annotation = MKPointAnnotation()

        annotation.coordinate = locationManager.location!.coordinate
        annotation.title = "ME!"
        self.map.addAnnotation(annotation)
        
        }
}

