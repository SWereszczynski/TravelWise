//
//  Resource.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

struct Resource<T> {

    let request: (String?) -> URLRequest
    let parse: (Data) throws -> T
}

struct ArrayResponse<T: Decodable>: Decodable {

    let items: [T]
}

extension Resource where T: Decodable {

    init(get endpoint: Endpoint) {
        request = { token in
            return URLRequest(endpoint: endpoint, token: token)
        }
        parse = { try CustomDecoder().decode(T.self, from: $0) }
    }

    init(delete endpoint: Endpoint) {
        request = { token in
            var request = URLRequest(endpoint: endpoint, token: token)
            request.httpMethod = "DELETE"
            return request
        }
        parse = { try CustomDecoder().decode(T.self, from: $0) }
    }

    init<A: Encodable>(post endpoint: Endpoint, body: A) {
        request = { token in
            var request = URLRequest(endpoint: endpoint, token: token)
            request.httpMethod = "POST"
            request.httpBody = try! JSONEncoder().encode(body)
            return request
        }
        parse = { try CustomDecoder().decode(T.self, from: $0) }
    }

    init<A: Encodable>(put endpoint: Endpoint, body: A) {
        request = { token in
            var request = URLRequest(endpoint: endpoint, token: token)
            request.httpMethod = "PUT"
            request.httpBody = try! JSONEncoder().encode(body)
            return request
        }
        parse = { try CustomDecoder().decode(T.self, from: $0) }
    }
}

struct EmptyResponse: Decodable {}
