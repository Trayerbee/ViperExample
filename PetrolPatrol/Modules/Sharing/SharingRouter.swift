//
//  SharingRouter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SharingRouter class
final class SharingRouter: Router {
}

// MARK: - SharingRouter API
extension SharingRouter: SharingRouterApi {
}

// MARK: - Sharing Viper Components
private extension SharingRouter {
    var presenter: SharingPresenterApi {
        return _presenter as! SharingPresenterApi
    }
}
