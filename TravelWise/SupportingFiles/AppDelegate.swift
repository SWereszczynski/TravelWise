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
    private(set) var appFlowController: AppFlowController!

    // MARK: - App life cycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startAppController()
        return true
    }

    // MARK: - Setup

    private func startAppController() {
        window = UIWindow()
        guard let `window` = window else { fatalError("Window is not initialized")}
        appFlowController = AppFlowController.default(window: window)
    }
}
