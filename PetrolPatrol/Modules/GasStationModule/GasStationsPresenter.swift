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
        view.setDrivers(stations: interactor.loadGasStations(sorted: filter, petrol: petrolType), petrol: petrolType, filter: filter)
        view.setTableSideEffect()
    }
    
    func reloadTableData(petrol: PetrolType?, filter closure: SortingClosure?) {

        if let closure = closure {
            filter = closure
        }
        
        if let petrol = petrol {
            petrolType = petrol
        }
        
        view.setDrivers(stations: interactor.loadGasStations(sorted: filter, petrol: petrolType), petrol: petrolType, filter: filter)
    }
    
    func loadMapFor(address: String) {
        router.showMap(address: address)
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
