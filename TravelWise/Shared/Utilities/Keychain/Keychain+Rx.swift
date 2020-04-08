//
//  Keychain+Rx.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

extension Keychain: ReactiveCompatible { }

extension Reactive where Base: KeychainProtocol {

    func save(key: KeychainKeys, data: Data) -> Observable<Void> {
        return Observable.create { observable -> Disposable in
            switch self.base.save(key: key, data: data) {
            case .success:
                observable.onNext(())
            case .unknownError:
                observable.onError(KeychainStatus.unknownError)
            }
            return Disposables.create()
        }
    }

    func get(key: KeychainKeys) -> Observable<Data?> {
        return .just(self.base.get(key: key))
    }

    func remove(key: KeychainKeys) -> Observable<Void> {
        return Observable.create { (observable) -> Disposable in
            switch self.base.remove(for: key) {
            case .success:
                observable.onNext(())
            case .unknownError:
                observable.onError(KeychainStatus.unknownError)
            }
            return Disposables.create()
        }
    }

    func clear() -> Observable<Void> {
        base.clear()
        return .just(())
    }
}
