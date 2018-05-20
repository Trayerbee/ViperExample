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
    
    func getStations(petrol: PetrolType = .super98) -> Driver<[GasStationCellData]> {
        return GasStationsResponse
            .fetch()
            .map {
                (response) -> [GasStationCellData]  in
            return GasStationCellData.cellDataFromInfoArray(stations: response.stations, petrolType: petrol) }
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
