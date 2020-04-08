//
//  TripsViewModel.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 30/03/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift
import RxCocoa

final class TripsViewModel {

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
    
}
