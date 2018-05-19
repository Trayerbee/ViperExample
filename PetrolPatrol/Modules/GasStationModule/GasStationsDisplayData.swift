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
    let price: [PetrolType: Double]
    let hours: String
    let favourite: Bool
    
    enum PetrolType {
        case super98
        case special95
        case ePlus
        case diesel
        case premiumDiesel
        
        /// This isn't allcaps, since we can capitilize later.
        func fuelName() -> String {
            switch self {
            case .super98:
                return "Super 98"
            case .special95:
                return "Special 95"
            case .ePlus:
                return "E plus"
            case .diesel:
                return "Diesel"
            case .premiumDiesel:
                return "Premium diesel"
            }
        }
    }
}
