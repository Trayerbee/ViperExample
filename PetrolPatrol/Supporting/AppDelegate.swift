//
//  AppDelegate.swift
//  PetrolPatrol
//
//  Created by Karshigabekov, Ilyas on 17/05/2018.
//  Copyright © 2018 Ilyas-Karshigabekov. All rights reserved.
//

// Google maps API Key AIzaSyA3YSQOTWM2PxSYDrmyX-bNHFX8pofRyN0

import UIKit
import GooglePlaces
import GoogleMaps
import Viperit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// Google maps and places init with API Key (API key from example project for xxbetrayerxx@gmail.com locked on this app bundle).
        GMSServices.provideAPIKey("AIzaSyA3YSQOTWM2PxSYDrmyX-bNHFX8pofRyN0")
        GMSPlacesClient.provideAPIKey("AIzaSyAg7g4eW2DDHJd5FCwH9xbRY7f2diJDgiQ")

        window = UIWindow(frame: UIScreen.main.bounds)
        let module = AppModules.gasStations.build()
        module.router.show(inWindow: window)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
