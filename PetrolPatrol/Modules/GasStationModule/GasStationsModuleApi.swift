//
//  GasStationsModuleApi.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Viperit
import RxCocoa
import RxSwift

//MARK: - GasStationsRouter API
protocol GasStationsRouterApi: RouterProtocol {
    func showMap(address: String)
}

//MARK: - GasStationsView API
protocol GasStationsViewApi: UserInterfaceProtocol {
    func setDrivers(stations: Observable<[GasStationInfo]>, petrol: PetrolType, filter: SortingClosure)
    func setTableSideEffect()
}

//MARK: - GasStationsPresenter API
protocol GasStationsPresenterApi: PresenterProtocol {
    var filter: SortingClosure { get }
    func reloadTableData(petrol: PetrolType?, filter: SortingClosure?)
    func loadMapFor(address: String)
}

//MARK: - GasStationsInteractor API
protocol GasStationsInteractorApi: InteractorProtocol {
    func loadGasStations(sorted: SortingClosure, petrol: PetrolType) -> Observable<[GasStationInfo]>
}
