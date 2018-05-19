//
//  GasStationsView.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit
import Viperit
import RxCocoa
import RxSwift

//MARK: GasStationsView Class
final class GasStationsView: UserInterface {
    @IBOutlet private var stationsTable: UITableView!
    let bag = DisposeBag()
}

//MARK: - GasStationsView API
extension GasStationsView: GasStationsViewApi {
    func setDrivers() {
        displayData.collectionDataDriver.debug("driving with").drive(stationsTable.rx.items(cellIdentifier: "StationCell", cellType: GasStationTableViewCell.self))
        { (_, data: GasStationCellData, cell) in
            cell.setCellData(stationData: data)
            }.disposed(by: bag)
    }
    
}   

// MARK: - GasStationsView Viper Components API
private extension GasStationsView {
    var presenter: GasStationsPresenterApi {
        return _presenter as! GasStationsPresenterApi
    }
    var displayData: GasStationsDisplayData {
        return _displayData as! GasStationsDisplayData
    }
}
