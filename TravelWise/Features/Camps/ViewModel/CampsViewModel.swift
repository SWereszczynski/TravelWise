//
//  CampsViewModel.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift
import RxCocoa

final class CampsViewModel {

    enum Route {
    }

    struct Input {
        let refreshTrigger: Observable<Void>
    }

    struct Output {
        let error: Driver<Error>
        let isLoading: Driver<Bool>
        let isEmpty: Driver<Bool>
    }
    
    private let dataSource: CampsDataSource
    let bag = DisposeBag()
    let route: PublishSubject<Route> = PublishSubject()
       
    init(dataSource: CampsDataSource) {
        self.dataSource = dataSource
    }
    
    func transform(input: Input) -> Output {
        let dataSource = self.dataSource

        return Output(error: Driver.empty(),
                      isLoading: Driver.empty(),
                      isEmpty: Driver.empty())
    }
}
