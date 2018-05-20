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
            [GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 5123),
             GasStationInfo(brand: .chevron, address: "Baraha St - Dubai - United Arab Emirates", price:[.super98: 2.50, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 700),
             GasStationInfo(brand: .eppco, address: "Sheikh Zd Rd, E 11, after Dnata - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 4000),
             GasStationInfo(brand: .chevron, address: "1 12 St - Dubai - United Arab Emirates", price:[.super98: 2.39, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 1230),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.10, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 1112),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.49, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 11230),
             GasStationInfo(brand: .eppco, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.59, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 3500),
             GasStationInfo(brand: .chevron, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.71, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 2500),
             GasStationInfo(brand: .enoc, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 2.60, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 1000),
             GasStationInfo(brand: .eppco, address: "Shk Mohd Bin Zd Rd, E 311, Int Media Production Zone - Dubai - United Arab Emirates", price:[.super98: 1.99, .special95: 2.37, .ePlus: 2.30, .diesel: 2.56, .premiumDiesel: 2.60], hours: "Today/ 24 hours", favourite: false, eTA: 1500),

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
    
    
    /// In real app with transport layer these would be only links or names of logos, but for this small app we can cut a corner here.
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
    let eTA: TimeInterval
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
