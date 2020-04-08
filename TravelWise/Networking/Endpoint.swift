//
//  Endpoint.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

enum Endpoint {
    case camps
}

extension Endpoint {
    
    var url: URL {
        switch self {
        case .camps:
            return URL(fileURLWithPath: "")
        }
    }
}
