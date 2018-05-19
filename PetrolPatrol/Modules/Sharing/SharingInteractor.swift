//
//  SharingInteractor.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SharingInteractor Class
final class SharingInteractor: Interactor {
}

// MARK: - SharingInteractor API
extension SharingInteractor: SharingInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension SharingInteractor {
    var presenter: SharingPresenterApi {
        return _presenter as! SharingPresenterApi
    }
}
