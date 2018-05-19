//
//  GasStationsDisplayData.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import Viperit
import RxSwift
import RxCocoa

// MARK: - GasStationsDisplayData class
final class GasStationsDisplayData: DisplayData {
    let collectionDataDriver: Driver<[GasStationCellData]>
    
    required init() {
        collectionDataDriver = Observable<[GasStationCellData]>.just(
            [GasStationCellData(brand: "ENOC", logo: "enoc", eTA: "5 min", address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price: "2.03", hours: "Today/ 24 hours", favourite: false),
             GasStationCellData(brand: "ENOC", logo: "enoc", eTA: "5 min", address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price: "2.03", hours: "Today/ 24 hours", favourite: false),
             GasStationCellData(brand: "ENOC", logo: "enoc", eTA: "5 min", address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price: "2.03", hours: "Today/ 24 hours", favourite: false),
             GasStationCellData(brand: "ENOC", logo: "enoc", eTA: "5 min", address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price: "2.03", hours: "Today/ 24 hours", favourite: false),
             GasStationCellData(brand: "ENOC", logo: "enoc", eTA: "5 min", address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price: "2.03", hours: "Today/ 24 hours", favourite: false)])
            .asDriver(onErrorJustReturn: [])
    }
}

struct GasStationCellData {
    let brand: String
    let logo: String
    let eTA: String
    let address: String
    let price: String
    let hours: String
    let favourite: Bool
}
