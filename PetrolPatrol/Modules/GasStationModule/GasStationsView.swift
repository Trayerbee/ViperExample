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
final class GasStationsView: UserInterface, UITableViewDelegate {
    
    /// Get this from user defaults?
    @IBOutlet private var stationsTable: UITableView!
    @IBOutlet weak var priceButton: BorderedSquareButton!
    @IBOutlet weak var distanceButton: BorderedSquareButton!
    
    
    @IBAction func switchedFilter(_ sender: BorderedSquareButton) {
        if sender == self.priceButton && presenter.filter != .byPrice {
            presenter.reloadTableData(petrolType: nil,  filter: .byPrice)
        }
        else if sender == self.distanceButton && presenter.filter != .byDistance {
            presenter.reloadTableData(petrolType: nil,  filter: .byDistance)
        }
    }
    
    @IBAction func filterSheet(_ sender: Any) {
        let petrolTypeActionSheet = UIAlertController(title: "Petrol type", message: "Choose petrol type bellow", preferredStyle: .actionSheet)
        
        let petrolTypes: [PetrolType] = [.super98, .special95, .ePlus, .premiumDiesel, .diesel]
        
        for petrolType in petrolTypes {
            let action = UIAlertAction(title: petrolType.fuelName(), style: .default) { [unowned self]
                (action) in
                self.gasTypeLabel.text = petrolType.fuelName()
                self.presenter.reloadTableData(petrolType: petrolType, filter: nil)
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
    func setDrivers(petrolType: PetrolType, filter: SortingClosure) {
        
        stationsTable.rx
            .setDelegate(self)
            .disposed(by: bag)
        
        switch filter {
        case .byDistance:
            distanceButton.layer.borderColor = UIColor.red.cgColor
            priceButton.layer.borderColor = UIColor.black.cgColor
        case .byPrice:
            distanceButton.layer.borderColor = UIColor.black.cgColor
            priceButton.layer.borderColor = UIColor.red.cgColor
        }
        
        let cellDataDriver = displayData.getStations(petrol: petrolType, sortingClosure: filter)
        
        cellDataDriver.drive(stationsTable.rx.items(cellIdentifier: "StationCell", cellType: GasStationTableViewCell.self))
        { (_, data: GasStationCellData, cell) in
            cell.setCellData(stationData: data)
            }.disposed(by: bag)
    }
    
    func setTableSideEffect() {
        stationsTable.rx
            .modelSelected(GasStationCellData.self)
            .debug("Picked a row")
            .subscribe(onNext: { [unowned self]
                (cellData) in
                self.presenter.loadMapFor(address: cellData.address)
            })
            .disposed(by: bag)
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
