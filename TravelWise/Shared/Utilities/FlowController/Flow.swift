//
//  Flow.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

protocol Flow {

    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
}
