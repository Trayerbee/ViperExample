//
//  SharingView.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import UIKit
import Viperit

//MARK: SharingView Class
final class SharingView: UserInterface {
}

//MARK: - SharingView API
extension SharingView: SharingViewApi {
}

// MARK: - SharingView Viper Components API
private extension SharingView {
    var presenter: SharingPresenterApi {
        return _presenter as! SharingPresenterApi
    }
    var displayData: SharingDisplayData {
        return _displayData as! SharingDisplayData
    }
}
