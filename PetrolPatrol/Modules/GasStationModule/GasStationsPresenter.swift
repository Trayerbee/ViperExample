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
    
    var petrolType: PetrolType = .super98
    var filter: SortingClosure = .byPrice
    
    override func viewIsAboutToAppear() {
        loadContent()
    }
}

// MARK: - GasStationsPresenter API
extension GasStationsPresenter: GasStationsPresenterApi {    
    func loadContent() {
        view.setDrivers(petrolType: petrolType, filter: filter)
    }
    
    func reloadTableData(petrolType: PetrolType?, filter: SortingClosure? = nil) {
                
        if let filter = filter {
            self.filter = filter
        }
        
        if let petrolType = petrolType {
            self.petrolType = petrolType
        }
        
        view.setDrivers(petrolType: self.petrolType, filter: self.filter)
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
