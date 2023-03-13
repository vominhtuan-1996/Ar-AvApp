//
//  MapViewController.swift
//  MageApp
//
//  Created by TuanIOS_SU12 on 13/03/2023.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController,CLLocationManagerDelegate{
    var locationManager:CLLocationManager!
    var mapView:GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self .setupLocationManager()
        self .loadGoogleMapView()
        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = self.mapView
        self.view = self.mapView
    }
    
    // MARK: function
    
    func setupLocationManager()  {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func loadGoogleMapView()  {
        let camera = GMSCameraPosition.camera(withLatitude: self.locationManager.location?.coordinate.latitude ?? 0.0, longitude: self.locationManager.location?.coordinate.longitude ?? 0.0, zoom: 6.0)
        self.mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.isMyLocationEnabled = true
        self.view.addSubview(self.mapView)
    }
    
    // MARK: locationManagerDelegate
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        print(locationObj.coordinate.latitude)
        print(locationObj.coordinate.longitude)
    }
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {

        //This method does real time status monitoring.

            switch status {
            case .notDetermined:
              print(".NotDetermined")
              break

            case .authorizedAlways:
              print(".AuthorizedAlways")
              break


            case .denied:
              print(".Denied")
              break

            case .authorizedWhenInUse:
              print(".AuthorizedWhenInUse")
              break

            case .restricted:
              print(".Restricted")
              break

            default:
              print("Unhandled authorization status")
              break

            }
          }
}
