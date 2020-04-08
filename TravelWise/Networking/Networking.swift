//
//  Networking.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

protocol NetworkingProtocol {

    func response<T>(from resource: Resource<T>) -> Observable<T>
}

struct Networking: NetworkingProtocol {
    
    static let `default` = Networking(keychain: Keychain(), session: URLSession.shared)

    private let keychain: KeychainProtocol
    private let session: URLSession

    private var token: String? {
        guard let data = keychain.get(key: .authToken) else { return nil }
        return String(data: data, encoding: .utf8)
    }

    private init(keychain: Keychain = Keychain(), session: URLSession = URLSession.shared) {
        self.keychain = keychain
        self.session = session
    }

    func response<T>(from resource: Resource<T>) -> Observable<T> {
        log(resource.request(self.token).url!)
        return Observable.create({ (observable) -> Disposable in
            let task = self.session.dataTask(with: resource.request(self.token), completionHandler: { (data, urlResponse, error) in
                self.parse(observable: observable, resource: resource, data: data, response: urlResponse, error: error)
            })
            task.resume()
            return Disposables.create {
                task.cancel() }
        })
    }

    private func parse<T>(observable: AnyObserver<T>, resource: Resource<T>, data: Data?, response: URLResponse?, error: Error?) {
        if let data = data {
            log("\n🚁 Response:\(String(data: data, encoding: .utf8)!)")
        }
        if let error = error {
            observable.onError(SavillsError(error: error))
        } else if let httpResponse = response as? HTTPURLResponse, (200...300).contains(httpResponse.statusCode), let data = data {
            do {
                let result = try resource.parse(data)
                observable.onNext(result)
                observable.onCompleted()
            } catch {
                log(error)
                observable.onError(error)
            }
        } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 && httpResponse.url! != Endpoint.signIn.url {
            keychain.clear()
            DispatchQueue.main.async { AppDelegate.delegate.appFlowController.setInitialState() }
        } else if let data = data {
            let apiError = try? JSONDecoder().decode(WebServiceError.self, from: data)
            observable.onError(apiError ?? WebServiceError.unknownServiceError)
        } else {
            observable.onError(WebServiceError.unknownServiceError)
        }
    }
}
