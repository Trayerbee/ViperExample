//
//  GasStationsInteractor.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import RxSwift

// MARK: - GasStationsInteractor Class
final class GasStationsInteractor: Interactor {
}

// MARK: - GasStationsInteractor API
extension GasStationsInteractor: GasStationsInteractorApi {
    func loadGasStations(sorted filter: SortingClosure, petrol: PetrolType) -> Observable<[GasStationInfo]> {
        return GasStationsResponse
            .fetch()
            .map { $0.stations.sorted(by: filter.getSortingClosure(petrol: petrol)) }
    }
}

// MARK: - Interactor Viper Components Api
private extension GasStationsInteractor {
    var presenter: GasStationsPresenterApi {
        return _presenter as! GasStationsPresenterApi
    }
}

enum SortingClosure {
        case byPrice
        case byDistance
        
        func getSortingClosure(petrol: PetrolType) -> ((GasStationInfo, GasStationInfo) -> Bool) {
            switch self {
            case .byPrice:
                return {
                    (firstCell: GasStationInfo, secondCell: GasStationInfo) -> Bool in
                    guard let firstPrice = firstCell.price[petrol], let secondPrice = secondCell.price[petrol] else {
                        return true
                    }
                    return firstPrice < secondPrice
                }
            case .byDistance:
                return {
                    (firstCell: GasStationInfo, secondCell: GasStationInfo) -> Bool in
                    return firstCell.eTA < secondCell.eTA
                }
            }
        }
}
