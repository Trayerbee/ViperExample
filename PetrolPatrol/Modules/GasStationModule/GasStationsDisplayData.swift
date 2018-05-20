//
//  GasStationsDisplayData.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import UIKit.UIImage
import RxSwift
import RxCocoa

// MARK: - GasStationsDisplayData class
final class GasStationsDisplayData: DisplayData {
//    let stations: Observable<[GasStationCellData]>
//    let collectionDataDriver: Driver<[GasStationCellData]>
    
    func getStations(petrol: PetrolType = .super98, sortingClosure: SortingClosure) -> Driver<[GasStationCellData]> {
        return GasStationsResponse
            .fetch()
            .map {
                (response) -> [GasStationCellData]  in
            return GasStationCellData.cellDataFromInfoArray(stations: response.stations.sorted(by: sortingClosure.getSortingClosure(petrol: petrol)), petrolType: petrol) }
            .asDriver(onErrorJustReturn: [])

    }
    
    required init() {
//        stations = GasStationsResponse.fetch().map { (response) -> [GasStationCellData]  in
//            return GasStationCellData.cellDataFromInfoArray(array: response.stations, petrolType: .super98)
//        }
//
//        collectionDataDriver = stations.asDriver(onErrorJustReturn: [])
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

struct GasStationCellData {
    let brand: String
    let logo: UIImage
    let address: String
    let price: String
    let hours: String
    let eTA: String
    let favourite: Bool
}

extension GasStationCellData {
    
    static func cellDataFromInfoArray(stations: [GasStationInfo], petrolType: PetrolType) -> [GasStationCellData] {
        var stationsCellDataList: [GasStationCellData] = []
        
        for stationInfo in stations {
            stationsCellDataList.append(GasStationCellData(info: stationInfo, petrol: petrolType))
        }
        
        return stationsCellDataList
    }
    
    init(info: GasStationInfo, petrol: PetrolType) {
        brand = info.brand.displayName()
        logo = info.brand.logo()
        address = info.address
        price = "\(info.price[petrol] ?? 0)"
        hours = info.hours
        eTA = "5 min"
        favourite = info.favourite
    }
}
