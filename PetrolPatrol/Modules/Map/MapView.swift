//
//  MapView.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit
import Viperit
import GoogleMaps
import RxCocoa
import RxSwift

//MARK: MapView Class
final class MapView: UserInterface {
    
    var locationManager = CLLocationManager()

    var address = ""
    
    let bag = DisposeBag()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBAction func goBack(_ sender: Any) {
        presenter.goBack()
    }
}

//MARK: - MapView API
extension MapView: MapViewApi {
    func showMap(to address: String, location: CLLocationCoordinate2D?) {
        if let location = location {
            self.address = address
            displayData.getRoute(location: location, address: address)
                .drive(onNext: { [unowned self]
                    (points) in
                    self.mapView.clear()
                    guard let path = GMSPath.init(fromEncodedPath: points) else {
                        return
                    }
                    let polyline = GMSPolyline(path: path)
                    polyline.strokeWidth = 3
                    let bounds = GMSCoordinateBounds(path: path)
                    self.mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                    polyline.map = self.mapView
                }).disposed(by: bag)
        }
        else {
            mapView.camera = GMSCameraPosition.camera(withLatitude: 25.2048, longitude: 55.2708, zoom: 15)
            mapView.isMyLocationEnabled = true
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        }
    }
}

/// TODO: Move this to Delegate Proxy and Rxify it.

extension MapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        if let myLocation = location {
            let camera = GMSCameraPosition.camera(withTarget: myLocation.coordinate, zoom: 15)
            mapView.animate(to: camera)
            presenter.getDirections(to: myLocation.coordinate)
        }
    }
}

// MARK: - MapView Viper Components API
private extension MapView {
    var presenter: MapPresenterApi {
        return _presenter as! MapPresenterApi
    }
    var displayData: MapDisplayData {
        return _displayData as! MapDisplayData
    }
}
