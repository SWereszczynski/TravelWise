//
//  BaseViewController.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 07/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import UIKit

internal class BaseViewController: UIViewController {

    // MARK: - Lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
        print("Init of \(self)")
    }

    deinit {
        print("Deinit of \(self)")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() { }
}
