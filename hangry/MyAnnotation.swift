//
//  MyAnnotation.swift
//  hangry
//
//  Created by Winnie Wen on 12/5/15.
//  Copyright © 2015 Winnie Wen. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class MyAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title: String!
    var imageName: String!
    
    init(coordinate: CLLocationCoordinate2D, title: String, imageName: String) {
        self.coordinate = coordinate
        self.title = title
        self.imageName = imageName
    }
}