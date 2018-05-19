//
//  MapRouter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MapRouter class
final class MapRouter: Router {
}

// MARK: - MapRouter API
extension MapRouter: MapRouterApi {
}

// MARK: - Map Viper Components
private extension MapRouter {
    var presenter: MapPresenterApi {
        return _presenter as! MapPresenterApi
    }
}
