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
    
}

//MARK: - GasStationsView API
protocol GasStationsViewApi: UserInterfaceProtocol {
    func setDrivers(petrolType: PetrolType)
}

//MARK: - GasStationsPresenter API
protocol GasStationsPresenterApi: PresenterProtocol {
    func switchPetrolType(petrolType: PetrolType)
}

//MARK: - GasStationsInteractor API
protocol GasStationsInteractorApi: InteractorProtocol {
    
}
