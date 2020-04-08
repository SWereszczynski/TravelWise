//
//  Bundle+Plist.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

extension Bundle {

    private var plist: [String: Any] {
        return Bundle.main.infoDictionary!
    }

    private var custom: [String: Any] {
        return plist["Custom"] as! [String: Any]
    }

    func value<T>(for key: String) -> T {
        guard let item = custom[key] as? T else { fatalError("No key '\(key)' in custom plist") }
        return item
    }

    var versionNumber: String {
        return value(for: "CFBundleShortVersionString")
    }

    var buildNumber: String {
        return value(for: "CFBundleVersion")
    }

    var buildDescription: String {
        return versionNumber + " " + "(" + buildNumber + ")"
    }

    var identifier: String {
        guard let identifier = self.bundleIdentifier else { fatalError() }
        return identifier
    }

}
