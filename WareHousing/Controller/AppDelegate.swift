//
//  AppDelegate.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/4/25.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("error initializig new realm \(error)")
        }
        
        return true

    }

}

