//
//  CampsBuilder.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

extension Builder.Camps {
    static func make() -> UINavigationController {
        let viewModel = CampsViewModel(dataSource: CampsService(networking: Current.networking))
        let viewController = CampsViewController(viewModel: viewModel)
        
        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.isNavigationBarHidden = true
        navigationController.modalPresentationStyle = .fullScreen

        let flowController = CampsFlowController(presenting: viewController.modal,
                                                 navigation: navigationController.navigation)
        
        viewModel.route
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .do(onNext: { flowController.handle(route: $0)})
            .subscribe()
            .disposed(by: viewModel.bag)
        
        return navigationController
    }
}
