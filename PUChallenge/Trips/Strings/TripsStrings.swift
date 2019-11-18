//
//  TripsStrings.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

enum TripsStrings {
    private static var bundle = Bundle.main
    private static var table = "Trips"

    static var tabBarTitle = NSLocalizedString("tab.bar.title",
                                               tableName: table,
                                               bundle: bundle,
                                               comment: String())
}
