//
//  MapDisplayData.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import CoreLocation.CLLocation
import RxCocoa

// MARK: - MapDisplayData class
final class MapDisplayData: DisplayData {
    func getRoute(location: CLLocationCoordinate2D, address: String) -> Driver<String> {
        return DirectionsResponse.fetchRoute(location: location, destination: address)
            .map { $0.points }
            .asDriver(onErrorJustReturn: "")
    }
}
