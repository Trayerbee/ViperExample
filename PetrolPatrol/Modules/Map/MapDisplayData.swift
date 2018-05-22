//
//  MapDisplayData.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import RxSwift
import RxCocoa
import GoogleMaps

// MARK: - MapDisplayData class
final class MapDisplayData: DisplayData {
    func getRoute(location: CLLocationCoordinate2D, address: String) -> Driver<String> {
        return DirectionsResponse.fetchRoute(location: location, destination: address)
            .map { $0.points }
            .asDriver(onErrorJustReturn: "")
    }
    
    func drivibleRoute(from points: Observable<String>) -> Driver<(polyline: GMSPolyline, bounds: GMSCoordinateBounds)> {
        return points.map {
            (mapPoints) -> (polyline: GMSPolyline, bounds: GMSCoordinateBounds) in
            guard let path = GMSPath.init(fromEncodedPath: mapPoints) else {
                throw "Illegal path"
            }
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 3
            let bounds = GMSCoordinateBounds(path: path)
            return (polyline: polyline, bounds: bounds)
        }
        .asDriver(onErrorJustReturn: (polyline: GMSPolyline(path: nil), bounds: GMSCoordinateBounds()))
    }
}
