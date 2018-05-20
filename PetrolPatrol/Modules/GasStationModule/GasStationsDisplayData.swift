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
    let stations: Observable<[GasStationCellData]>
    let collectionDataDriver: Driver<[GasStationCellData]>
    
    required init() {
        stations = GasStationsResponse.fetch().map { (response) -> [GasStationCellData]  in
            return GasStationCellData.dataFromInfoArray(array: response.stations)
        }
        
        collectionDataDriver = stations.asDriver(onErrorJustReturn: [])
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
    
    static func dataFromInfoArray(array: [GasStationInfo]) -> [GasStationCellData] {
        var dataArray: [GasStationCellData] = []
        
        for stationInfo in array {
            dataArray.append(GasStationCellData(info: stationInfo, petrol: .super98))
        }
        
        return dataArray
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
