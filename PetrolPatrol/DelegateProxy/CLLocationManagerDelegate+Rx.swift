//
//  CLLocationManagerDelegateProxy.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 22/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

import Foundation
import CoreLocation.CLLocationManager
import RxSwift
import RxCocoa

extension Reactive where Base: CLLocationManager {
    public var delegate: DelegateProxy<CLLocationManager, CLLocationManagerDelegate> {
        return CLLocationManagerDelegateProxy.proxy(for: base)
    }
    
    private var castDelegate: CLLocationManagerDelegateProxy {
        return castOrFatalError(delegate)
    }
    
    public var locations: Observable<[CLLocation]> {
        return castDelegate.locations
    }
}

extension CLLocationManager: HasDelegate {
    public typealias Delegate = CLLocationManagerDelegate
}

internal final class CLLocationManagerDelegateProxy: DelegateProxy<CLLocationManager, CLLocationManagerDelegate>, CLLocationManagerDelegate, DelegateProxyType {
    
    public weak private(set) var clLocationManager: CLLocationManager?
    
    public init(locationManager: ParentObject) {
        self.clLocationManager = locationManager
        super.init(parentObject: locationManager, delegateProxy: CLLocationManagerDelegateProxy.self)
    }
    
    // Register known implementations
    public static func registerKnownImplementations() {
        self.register { CLLocationManagerDelegateProxy(locationManager: $0) }
    }

    private let locationsSink = PublishSubject<[CLLocation]>()
    
    internal var locations: Observable<[CLLocation]> {
        return locationsSink.asObservable()
    }
    
    deinit {
        locationsSink.onCompleted()
    }
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationsSink.onNext(locations)
    }
    
    /// For more information take a look at `DelegateProxyType`.
    internal class func currentDelegateFor(_ object: AnyObject) -> AnyObject? {
        let publisher: CLLocationManager = castOrFatalError(object)
        return publisher.delegate
    }
    
    /// For more information take a look at `DelegateProxyType`.
    internal class func setCurrentDelegate(_ delegate: AnyObject?, toObject object: AnyObject) {
        let publisher: CLLocationManager = castOrFatalError(object)
        publisher.delegate = delegate as? CLLocationManagerDelegate
    }
}
