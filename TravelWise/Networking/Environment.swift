//
//  Environment.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

struct Environment {

    static subscript<T>(key: Key) -> T {
        return Bundle.main.value(for: key.rawValue)
    }

    enum Key: String {
        case serverURL = "example.url.com/"//"SERVER_URL"
    }
}
