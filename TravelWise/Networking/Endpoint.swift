//
//  Endpoint.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

enum Endpoint {
    case trips
}

extension Endpoint {
    
    var url: URL {
        switch self {
        case .trips:
            return URL(fileURLWithPath: "")
        }
    }
}
