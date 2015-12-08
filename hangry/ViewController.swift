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

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!

    
    
    
    var locationManager: CLLocationManager!
    let searchRadius: CLLocationDistance = 2000
    
    let initialLocation = CLLocation(latitude: 49.140838, longitude: -123.127886)
    var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For Location 1
        let location1 = CLLocationCoordinate2D(
            latitude: 51.481188400000010000,
            longitude: -0.190209099999947280
        )
        self.mapView.delegate = self
        
        let annotation1: CustomPointAnnotation = CustomPointAnnotation()
        annotation1.coordinate = location1;
        annotation1.title = "Hangry Bird"
        annotation1.subtitle = "Hangry Bird's location"
        
        let span = MKCoordinateSpanMake(0.15, 0.15)
        
        let region1 = MKCoordinateRegion(center: location1, span: span)
        mapView.setRegion(region1, animated: true)
        mapView.addAnnotation(annotation1)
        
        //For Location 2
        let location2 = CLLocationCoordinate2D(
            latitude: 51.554947700000010000,
            longitude: -0.108558899999934510
        )
        
        let annotation2: CustomPointAnnotation = CustomPointAnnotation()
        annotation2.coordinate = location2;
        annotation2.title = "Arsenal"
        annotation2.subtitle = "Arsenal"
        
        let region2 = MKCoordinateRegion(center: location1, span: span)
        mapView.setRegion(region2, animated: true)
        mapView.addAnnotation(annotation2)
        
        var locations = [CLLocation(latitude: 51.481188400000010000, longitude: -0.190209099999947280), CLLocation(latitude: 51.554947700000010000,longitude:  -0.108558899999934510)]
    
        var coordinates = locations.map {
            location in
            return location.coordinate
        }
        
        //var polyline = MKPolyline(coordinates: &coordinates, count: locations.count)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location1, searchRadius * 2.0, searchRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        searchInMap()
        
        //var points: [CLLocationCoordinate2D] = [CLLocationCoordinate2D]()
        
        var polyline = MKPolyline(coordinates:&points, count: points.count)
        mapView.addOverlay(polyline)
        

    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            var polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blueColor()
            polylineRenderer.lineWidth = 5
            return polylineRenderer
            
        }
        
        return nil
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
    
    
    
    func addPinToMapView(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        var pointAnnotation: CustomPointAnnotation = CustomPointAnnotation()
        pointAnnotation.coordinate = location
        pointAnnotation.title = title
        
        //pointAnnotation.pinCustomImageName = "food.png"
        points.append(location)
        
        self.mapView.addAnnotation(pointAnnotation)
        self.mapView?.selectAnnotation(pointAnnotation, animated: true)
        var polyline = MKPolyline(coordinates:&points, count: points.count)
        mapView.addOverlay(polyline)
        
        
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
            if (anView!.annotation!.title! == "Hangry Bird") {

                anView!.image = UIImage(named:"angry-bird-icon.png")
                //anView!.draggable = true
            }
            else {
                anView!.image = UIImage(named:"ice_cream.png")
                
            }
            return anView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}