//
//  ViewController.swift
//  hangryBird
//
//  Created by Winnie Wen on 12/5/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    let locationManager = CLLocationManager()
    let searchRadius: CLLocationDistance = 2000
    
    let initialLocation = CLLocation(latitude: 49.140838, longitude: -123.127886)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Current Location
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    
        //mapView.setRegion(region, animated: true)

    
        mapView.delegate = self
        
    
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius * 2.0, searchRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.delegate = self
        searchInMap()
        addBoundry()

    }

    func addPinToMapView(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        var pointAnnotation: CustomPointAnnotation = CustomPointAnnotation()
        pointAnnotation.coordinate = location
        pointAnnotation.title = title
        
        pointAnnotation.pinCustomImageName = "food.png"
        
        self.mapView.addAnnotation(pointAnnotation)
        self.mapView?.selectAnnotation(pointAnnotation, animated: true)
        
        
    }
    func mapView (mapView: MKMapView,
        viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
            
            let reuseId = "test"
            
            var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            if anView == nil {
                anView = MKAnnotationView(annotation: annotation, reuseIdentifier:
                    reuseId)
                anView!.canShowCallout = true
            }
            else {
                anView!.annotation = annotation
            }
            
            let cpa = annotation as! CustomPointAnnotation
            anView!.image = UIImage(named:cpa.pinCustomImageName)
            
            return anView
    }
    func addBoundry()
    {
        var points=[CLLocationCoordinate2DMake(49.142677,  -123.135139),CLLocationCoordinate2DMake(49.142730, -123.125794),CLLocationCoordinate2DMake(49.140874, -123.125805),CLLocationCoordinate2DMake(49.140885, -123.135214)]
        
        let polygon = MKPolygon(coordinates: &points, count: points.count)
        
        mapView.addOverlay(polygon)
    }
    

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
            // Dispose of any resources that can be recreated.
    
        }


    func searchInMap() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = "Restaurants"
        request.region = mapView.region

        let search: MKLocalSearch = MKLocalSearch(request: request)
        
        search.startWithCompletionHandler {
            response, error in guard let response = response
            else {
                print("Error")
                return
            }
            
            for item in response.mapItems {
                self.addPinToMapView(item.name!, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
            
            }
        }
    }
}