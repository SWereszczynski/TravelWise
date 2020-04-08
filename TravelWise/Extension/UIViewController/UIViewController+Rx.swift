//
//  UIViewController+Rx.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift
import RxCocoa

extension Reactive where Base: UIViewController {

    var showError: AnyObserver<Error> {
        return Binder(base) { controller, error in
            controller.present(UIAlertController(error: error), animated: true, completion: nil)
            }.asObserver()
    }
}
