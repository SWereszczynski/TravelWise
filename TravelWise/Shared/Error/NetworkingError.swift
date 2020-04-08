//
//  NetworkingError.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

struct NetworkingError: Decodable, Error {

    let code: String
    let messages: [String]
}

extension NetworkingError: LocalizedError {

    public var errorDescription: String? {
        switch code {
        case "unknown_service_error":
            return "error"
        case "asp_user_not_found":
            return "error"
        case "incorrect_username_or_password":
            return "error"
        default:
            return messages.first
        }
    }
}

extension NetworkingError {

    static let unknownServiceError = NetworkingError(code: "unknown_service_error", messages: ["error"])
}
