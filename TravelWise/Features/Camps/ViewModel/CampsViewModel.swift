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
        let camps: Driver<[Camp]>
        let error: Driver<Error>
        let isLoading: Driver<Bool>
    }
    
    private let dataSource: CampsDataSource
    let bag = DisposeBag()
    let route: PublishSubject<Route> = PublishSubject()
       
    init(dataSource: CampsDataSource) {
        self.dataSource = dataSource
    }
    
    func transform(input: Input) -> Output {
        let dataSource = self.dataSource
        
        let campsResponse = input.refreshTrigger
            .startWith(())
            .flatMapLatest { dataSource.fetchCamps().materialize() }
            .share()
        
        let camps = campsResponse
            .compactMap { $0.element }
            .asDriverLogError()
        
        let error = campsResponse
            .compactMap { $0.error }
            .asDriverLogError()
        
        let isLoading = Observable.merge(input.refreshTrigger.startWith(()).map { _ in true },
                                         campsResponse.map { _ in false })
            .asDriverLogError()

        
        return Output(camps: camps,
                      error: error,
                      isLoading: isLoading)
    }
}
