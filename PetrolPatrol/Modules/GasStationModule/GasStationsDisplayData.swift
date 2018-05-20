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
        collectionDataDriver = Driver<[GasStationCellData]>.empty()
    }
}

struct GasStationCellData {
    let brand: String
    let logo: String
    let address: String
    let price: String
    let hours: String
    let eTA: String
    let favourite: Bool
}
