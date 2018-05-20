//
//  GasStationsMockRespons.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 20/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import RxSwift
import UIKit.UIImage

struct GasStationsResponse {
    let stations: [GasStationInfo]
}

extension GasStationsResponse {
    // This is a mock up, in real app we will call API here.
    static func fetch() -> Observable<GasStationsResponse> {
        return Observable<[GasStationInfo]>.just(
            [GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .chevron, address: "Baraha St - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .eppco, address: "Sheikh Zd Rd, E 11, after Dnata - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .chevron, address: "1 12 St - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .eppco, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .chevron, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),
             GasStationInfo(brand: .eppco, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false),

             ])
            .map { GasStationsResponse(stations: $0) }
    }
}

enum GasBrand {
    case chevron
    case enoc
    case eppco
    
    func displayName() -> String {
        switch self {
        case .chevron:
            return "Chevron"
        case .enoc:
            return "ENOC"
        case .eppco:
            return "EPPCO"
        }
    }
    
    func logo() -> UIImage {
        switch self {
        case .chevron:
            return #imageLiteral(resourceName: "chevron")
        case .enoc:
            return #imageLiteral(resourceName: "enoc")
        case .eppco:
            return #imageLiteral(resourceName: "eppco")
        }
    }
}

struct GasStationInfo {
    let brand: GasBrand
    let address: String
    let price: [PetrolType: Double]
    let hours: String
    let favourite: Bool
}

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
