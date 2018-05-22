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
import RxSwift

//MARK: - MapRouter API
protocol MapRouterApi: RouterProtocol {
    func showMapForAddress(from: UserInterface, address: String)
    func goBack()
}

//MARK: - MapView API
protocol MapViewApi: UserInterfaceProtocol {
    func showMap()
    func showRoute(with points: Observable<String>)
}

//MARK: - MapPresenter API
protocol MapPresenterApi: PresenterProtocol {
    var address: String { get }
    func set(address: String)
    func getDirections(to: CLLocationCoordinate2D)
    func goBack()
}

//MARK: - MapInteractor API
protocol MapInteractorApi: InteractorProtocol {
    func loadRoute(location: CLLocationCoordinate2D, address: String) -> Observable<String>
}
