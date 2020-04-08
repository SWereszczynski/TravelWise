//
//  UIViewController+Flow.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var modal: Flow {
        return ModalFlow(viewController: self)
    }
    
    private struct ModalFlow: Flow {
        
        private weak var viewController: UIViewController?
        
        init(viewController: UIViewController) {
            self.viewController = viewController
        }
        
        func present(_ viewController: UIViewController, animated: Bool) {
            self.viewController?.present(viewController, animated: animated, completion: nil)
        }
        
        func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
            self.viewController?.dismiss(animated: animated, completion: completion)
        }
        
        func popToViewController(_ viewController: UIViewController, animated: Bool) {
            self.viewController?.dismiss(animated: animated, completion: nil)
        }
    }
}
