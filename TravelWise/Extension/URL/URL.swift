//
//  URL.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

extension URL {

    init(_ string: String) {
        guard let url = URL(string: string) else { fatalError("Could not create url from \(string)") }
        self = url
    }
    
    mutating func appending(_ queryItem: String, value: String?) {
        guard var urlComponents = URLComponents(string: absoluteString) else { return }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        self =  urlComponents.url!
    }
}
