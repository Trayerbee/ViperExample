//
//  MapPresenter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation.CLLocation

// MARK: - MapPresenter Class
final class MapPresenter: Presenter {
    var address: String = ""
    override func viewIsAboutToAppear() {
        view.showMap(to: self.address, location: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708))
    }
}

// MARK: - MapPresenter API
extension MapPresenter: MapPresenterApi {
    func set(address: String) {
        self.address = address
    }
    
    func getDirections(to location: CLLocationCoordinate2D?) {
        view.showMap(to: address, location: location)
    }
    
    func goBack() {
        router.goBack()
    }
}

// MARK: - Map Viper Components
private extension MapPresenter {
    var view: MapViewApi {
        return _view as! MapViewApi
    }
    var interactor: MapInteractorApi {
        return _interactor as! MapInteractorApi
    }
    var router: MapRouterApi {
        return _router as! MapRouterApi
    }
}
