//
//  UINavigationController+Flow.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

extension UINavigationController {

    var navigation: Flow {
        return NavigationFlow(navigationController: self)
    }

    private struct NavigationFlow: Flow {

        private weak var navigationController: UINavigationController?

        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }

        func present(_ viewController: UIViewController, animated: Bool) {
            self.navigationController?.pushViewController(viewController, animated: animated)
        }

        func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
            self.navigationController?.popViewController(animated: animated)
        }
        
        func popToViewController(_ viewController: UIViewController, animated: Bool) {
            self.navigationController?.popToViewController(viewController, animated: animated)
        }
    }
}
