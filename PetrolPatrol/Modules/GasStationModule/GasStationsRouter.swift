//
//  GasStationsRouter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GasStationsRouter class
final class GasStationsRouter: Router {
}

// MARK: - GasStationsRouter API
extension GasStationsRouter: GasStationsRouterApi {
}

// MARK: - GasStations Viper Components
private extension GasStationsRouter {
    var presenter: GasStationsPresenterApi {
        return _presenter as! GasStationsPresenterApi
    }
}
