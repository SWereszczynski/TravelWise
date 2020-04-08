//
//  Log.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

func log(_ items: Any..., file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let fileName = file.components(separatedBy: "/").last ?? ""
    print("✏️ Log:")
    print("🗺 File: \(fileName), Function: \(function), Line: \(line)")
    print("📝 \(items)")
    #endif
}
