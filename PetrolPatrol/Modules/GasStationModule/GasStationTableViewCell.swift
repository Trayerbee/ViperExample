//
//  GasStationCollectionViewCell.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 19/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit
import Foundation

class GasStationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var nameAndETA: UILabel!
    @IBOutlet weak var address: UILabel!
//    @IBOutlet weak var openHours: UILabel!  for the sake of this example all gas stations are working 24/7 😉
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var currency: UILabel!
    
    func setCellData(stationData: GasStationCellData) {
        // Set image of brand
        logo.image = stationData.logo
        
        // Set title of the cell brand + ETA, half of it is green.
        let mainAttributedText: NSMutableAttributedString = NSMutableAttributedString(string: "\(stationData.brand) / \(stationData.eTA)", attributes: StyleGuide.blackCellTitleAttributes())
        
        mainAttributedText.addAttribute(NSAttributedStringKey.foregroundColor, value: StyleGuide.greenColor(), range: NSRange(location: "\(stationData.brand) / ".count, length: stationData.eTA.count))
        
        nameAndETA.attributedText = mainAttributedText.copy() as? NSAttributedString
        
        address.text = stationData.address
        
        price.text = stationData.price
        
        currency.text = Locale.current.currencyCode
    }
}

