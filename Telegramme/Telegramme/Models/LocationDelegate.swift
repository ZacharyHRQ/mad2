//
//  LocationDelegate.swift
//  Telegramme
//
//  Created by shadow on 2/1/21.
//

import CoreLocation


class LocationDelegate: NSObject,CLLocationManagerDelegate {
    
    var locationCallback:((CLLocation) -> ())? = nil
    
    func locationManager(_ manager: CLLocationManager,
                    didUpdateLocations locations: [CLLocation]){
        guard let currentLocation = locations.last else {return}
        locationCallback?(currentLocation)
    }
}
