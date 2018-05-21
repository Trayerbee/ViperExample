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
    func getCellDataStations(from stations: Observable<[GasStationInfo]>, for petrol: PetrolType) -> Driver<[GasStationCellData]> {
        return stations.map {
                (stations) -> [GasStationCellData]  in
            return GasStationCellData.cellDataFromInfoArray(stations: stations, petrolType: petrol)
            
            }
            .asDriver(onErrorJustReturn: [])
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
        
        /// We just round up to nearest minute, since few second wouldn't change a lot. Convert into Int to remove those decimal places.
        eTA = "\(Int((info.eTA/60.0).rounded(.up))) min"
        favourite = info.favourite
    }
}
