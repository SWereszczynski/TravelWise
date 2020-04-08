//
//  AppDelegate.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

public let Current = World()

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static let delegate = UIApplication.shared.delegate as! AppDelegate

    // MARK: - App life cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}
