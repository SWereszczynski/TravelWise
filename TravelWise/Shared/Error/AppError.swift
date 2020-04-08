//
//  AppError.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

enum AppError: Error {

    case unknown
    case notFound
    case notConnectedToInternet
    case noResults

    init(error: Error) {
        switch error {
        case let error as AppError:
            self = error
        case let `error` as NSError:
            if error.code == NSURLErrorNotConnectedToInternet {
                self = .notConnectedToInternet
            } else {
                fallthrough
            }
        default:
            self = .unknown
        }
    }
    
    init() {
        self = .unknown
    }
}

extension AppError: LocalizedError {

    public var errorDescription: String? {
        switch self {
        case .notFound:
            return nil
        case .unknown:
            return nil
        case .notConnectedToInternet:
            return "no internet connection"
        case .noResults:
            return nil
        }
    }
}
