//
//  DirectionsAPIResponse.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 21/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire.Swift
import RxAlamofire
import Freddy
import CoreLocation.CLLocation

struct DirectionsResponse {
    let points: String
}

extension DirectionsResponse {
    static func fetchRoute(location: CLLocationCoordinate2D, destination: String) -> Observable<DirectionsResponse> {
        /// Hardcoding and force a lot of stuff here, but it's ok since I am sure it'll work 😇
        let parameters =  ["origin":"\(location.latitude),\(location.longitude)", "key": "AIzaSyA3YSQOTWM2PxSYDrmyX-bNHFX8pofRyN0", "destination": destination, "mode": "driving"]
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json")!
        
        return RxAlamofire.requestData(.get, url, parameters: parameters, encoding: URLEncoding.default, headers: [:])
            .map { (response) -> JSON in
                return try JSON(data: response.1)
            }
            .map { (json) -> DirectionsResponse in
                return try DirectionsResponse(json: json)
            }
            .debug("Directions response")
    }
}

extension DirectionsResponse: JSONDecodable {
    init(json: JSON) throws {
        let routes = try json.getArray(at: "routes")
        guard let routeOne = routes.first else {
            throw "Failed to get single route"
        }
        points = try routeOne.getString(at: "overview_polyline", "points")
    }
}

extension String: Error {}
