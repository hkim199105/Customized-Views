//
//  MapKitViewController.swift
//  Button Hell
//
//  Created by hkim on 2019. 1. 29..
//  Copyright © 2019년 hkim. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let mPos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        let mSpan = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let mRegion = MKCoordinateRegion(center: mPos, span: mSpan)
        let mPoint = MKPointAnnotation()
        mPoint.coordinate = mPos
        mapkitView.region = mRegion
        mapkitView.regionThatFits(mRegion)
        mapkitView.addAnnotation(mPoint)
        
        self.preferredContentSize.height = 200
        self.preferredContentSize.width = 500
        self.view = mapkitView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
