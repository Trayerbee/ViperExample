//
//  MapInteractor.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MapInteractor Class
final class MapInteractor: Interactor {
}

// MARK: - MapInteractor API
extension MapInteractor: MapInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension MapInteractor {
    var presenter: MapPresenterApi {
        return _presenter as! MapPresenterApi
    }
}
