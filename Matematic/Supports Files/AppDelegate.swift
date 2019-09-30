//
//  AppDelegate.swift
//  Matematic
//
//  Created by  Джон Костанов on 08/06/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let notifications = Notifications()
    
    lazy var coreDataStack = CoreDataStack(modelName: "Matematic")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let navController = window?.rootViewController as? UINavigationController,
            let viewController = navController.topViewController as? MainViewController else {
                return true
        }
        
        viewController.managedContext = coreDataStack.managedContext
        notifications.requestAutorization()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    
}

