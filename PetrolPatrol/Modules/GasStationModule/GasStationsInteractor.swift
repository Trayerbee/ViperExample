//
//  GasStationsInteractor.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GasStationsInteractor Class
final class GasStationsInteractor: Interactor {
}

// MARK: - GasStationsInteractor API
extension GasStationsInteractor: GasStationsInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension GasStationsInteractor {
    var presenter: GasStationsPresenterApi {
        return _presenter as! GasStationsPresenterApi
    }
}
    
