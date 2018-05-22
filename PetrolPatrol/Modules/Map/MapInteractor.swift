//
//  MapInteractor.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation.CLLocation
import RxSwift

// MARK: - MapInteractor Class
final class MapInteractor: Interactor {
}

// MARK: - MapInteractor API
extension MapInteractor: MapInteractorApi {
    func loadRoute(location: CLLocationCoordinate2D, address: String) -> Observable<String> {
        return DirectionsResponse.fetchRoute(location: location, destination: address)
            .map { $0.points }
    }
}

// MARK: - Interactor Viper Components Api
private extension MapInteractor {
    var presenter: MapPresenterApi {
        return _presenter as! MapPresenterApi
    }
}
