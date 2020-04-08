//
//  World.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import Foundation

public struct World {
    
    var date = { Date() }
    var calendar = Calendar.autoupdatingCurrent
    var timezone = TimeZone.autoupdatingCurrent
    var locale = Locale.autoupdatingCurrent

    var keychain = Keychain.default
    var networking = Networking.default
}
