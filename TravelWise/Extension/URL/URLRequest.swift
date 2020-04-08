//
//  URLRequest.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

extension URLRequest {

    init(endpoint: Endpoint, token: String?) {
        var request = URLRequest(url: endpoint.url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("1", forHTTPHeaderField: "API-version")
        if let token = token, token.isEmpty == false {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        self = request
    }
}
