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
    
    /// Get this from user defaults?
    @IBOutlet private var stationsTable: UITableView!
    
    @IBAction func filterSheet(_ sender: Any) {
        let petrolTypeActionSheet = UIAlertController(title: "Petrol type", message: "Choose petrol type bellow", preferredStyle: .actionSheet)
        
        let petrolTypes: [PetrolType] = [.super98, .special95, .ePlus, .premiumDiesel, .diesel]
        
        for petrolType in petrolTypes {
            let action = UIAlertAction(title: petrolType.fuelName(), style: .default) { [unowned self]
                (action) in
                self.gasTypeLabel.text = petrolType.fuelName()
                self.presenter.switchPetrolType(petrolType: petrolType)
            }
            petrolTypeActionSheet.addAction(action)
        }
        present(petrolTypeActionSheet, animated: true)
    }
   
    @IBOutlet weak var gasTypeLabel: UILabel!
    
    @IBAction func showMenu(_ sender: Any) {
    }
    
    let bag = DisposeBag()
}

//MARK: - GasStationsView API
extension GasStationsView: GasStationsViewApi {    
    func setDrivers(petrolType: PetrolType) {
        let cellDataDriver = displayData.getStations(petrol: petrolType, sortingClosure: .byPrice)
        cellDataDriver.drive(stationsTable.rx.items(cellIdentifier: "StationCell", cellType: GasStationTableViewCell.self))
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
