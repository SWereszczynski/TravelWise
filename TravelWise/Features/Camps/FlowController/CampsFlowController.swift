//
//  CampsFlowController.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

final class CampsFlowController {

    private let navigation: Flow
    private let presenting: Flow
    
    let bag = DisposeBag()

    init(presenting: Flow, navigation: Flow) {
        self.presenting = presenting
        self.navigation = navigation
    }

    func handle(route: CampsViewModel.Route) {
        switch route {
        }
    }
}
