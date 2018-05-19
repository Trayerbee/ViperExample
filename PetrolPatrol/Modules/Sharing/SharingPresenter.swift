//
//  SharingPresenter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - SharingPresenter Class
final class SharingPresenter: Presenter {
}

// MARK: - SharingPresenter API
extension SharingPresenter: SharingPresenterApi {
}

// MARK: - Sharing Viper Components
private extension SharingPresenter {
    var view: SharingViewApi {
        return _view as! SharingViewApi
    }
    var interactor: SharingInteractorApi {
        return _interactor as! SharingInteractorApi
    }
    var router: SharingRouterApi {
        return _router as! SharingRouterApi
    }
}
