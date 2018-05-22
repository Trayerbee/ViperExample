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
    func showRoute(with points: Observable<String>) {
        displayData.drivibleRoute(from: points)
            .drive(onNext: { (polyline, bounds) in
                self.mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                polyline.map = self.mapView
            }).disposed(by: bag)
    }
    func showMap() {
        mapView.isMyLocationEnabled = true
        locationManager.rx.locations
            .do(onNext: { [unowned self] // We are not capturing self here, since this goes off into presenter part
                (locations) in
                guard let myLocation = locations.last else {
                    return
                }
                self.presenter.getDirections(to: myLocation.coordinate)
            })
            .take(1) // The idea here is that we only need this before route thing kicks in
            .asDriver(onErrorJustReturn: [])
            .drive(onNext: { (locations) in
                guard let myLocation = locations.last else {
                    return
                }
                self.mapView.camera = GMSCameraPosition.camera(withLatitude: myLocation.coordinate.latitude, longitude: myLocation.coordinate.longitude, zoom: 15)
            })
            .disposed(by: bag)
        locationManager.startUpdatingLocation()
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
