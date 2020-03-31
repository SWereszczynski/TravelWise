//
//  AppFlowController.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

final class AppFlowController {

    private var rootController: UIViewController? { didSet { setupWindowRoot()  } }

    private let window: UIWindow

    init(window: UIWindow) {
        window.backgroundColor = .white
        self.window = window
        window.makeKeyAndVisible()
        showTrips()
    }

    private func showTrips() {
        rootController = Builder.Trips.make()
    }

    private func setupWindowRoot() {
        window.rootViewController = rootController
    }
}

extension AppFlowController {
    
    static func `default`(window: UIWindow) -> AppFlowController {
        return AppFlowController(window: window)
    }
}
