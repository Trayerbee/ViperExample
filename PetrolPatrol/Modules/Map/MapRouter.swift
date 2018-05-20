//
//  MapRouter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit.UIWindow
import Viperit

// MARK: - MapRouter class
final class MapRouter: Router {
    func goBack() {
        let module = AppModules.gasStations.build()
        module.router.show(from: _view)
    }
}

// MARK: - MapRouter API
extension MapRouter: MapRouterApi {
    func showMapForAddress(from view: UserInterface, address: String) {
        self.show(from: view)
        presenter.set(address: address)
    }
}

// MARK: - Map Viper Components
private extension MapRouter {
    var presenter: MapPresenterApi {
        return _presenter as! MapPresenterApi
    }
}
