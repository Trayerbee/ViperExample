//
//  GasStationsRouter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit
import Foundation
import Viperit

// MARK: - GasStationsRouter class
final class GasStationsRouter: Router {
}

// MARK: - GasStationsRouter API
extension GasStationsRouter: GasStationsRouterApi {
    func showMap(address: String) {
        let module = AppModules.map.build()
        let mapRouter =  module.router as! MapRouterApi
        mapRouter.showMapForAddress(from: _view, address: address)
    }
}

// MARK: - GasStations Viper Components
private extension GasStationsRouter {
    var presenter: GasStationsPresenterApi {
        return _presenter as! GasStationsPresenterApi
    }
}
