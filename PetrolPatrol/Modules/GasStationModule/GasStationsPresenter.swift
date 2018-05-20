//
//  GasStationsPresenter.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit

// MARK: - GasStationsPresenter Class
final class GasStationsPresenter: Presenter {
    var petrolType: PetrolType?
    
    override func viewIsAboutToAppear() {
        loadContent()
    }
}

// MARK: - GasStationsPresenter API
extension GasStationsPresenter: GasStationsPresenterApi {
    func loadContent() {
        
        view.setDrivers()
    }
    
    func changePetrolType(type: PetrolType){
        
    }
}

// MARK: - GasStations Viper Components
private extension GasStationsPresenter {
    var view: GasStationsViewApi {
        return _view as! GasStationsViewApi
    }
    var interactor: GasStationsInteractorApi {
        return _interactor as! GasStationsInteractorApi
    }
    var router: GasStationsRouterApi {
        return _router as! GasStationsRouterApi
    }
}
