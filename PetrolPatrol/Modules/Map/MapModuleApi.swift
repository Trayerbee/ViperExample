//
//  MapModuleApi.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 18/05/2018.
//Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Viperit
import UIKit.UIWindow
import CoreLocation.CLLocation

//MARK: - MapRouter API
protocol MapRouterApi: RouterProtocol {
    func showMapForAddress(from: UserInterface, address: String)
    func goBack()
}

//MARK: - MapView API
protocol MapViewApi: UserInterfaceProtocol {
    func showMap(to address: String, location: CLLocationCoordinate2D?)
}

//MARK: - MapPresenter API
protocol MapPresenterApi: PresenterProtocol {
    var address: String { get }
    func set(address: String)
    func getDirections(to: CLLocationCoordinate2D?)
    func goBack()
}

//MARK: - MapInteractor API
protocol MapInteractorApi: InteractorProtocol {
}
