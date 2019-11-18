//
//  ProductsStrings.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
enum ProductsStrings {
    private static var bundle = Bundle.main
    private static var table = "Products"

    static var tabBarTitle = string(for: "tab.bar.title")
    static var fromPriceLabel = string(for: "from.price.label")

    private static func string(for key: String) -> String {
        return NSLocalizedString(key,
                                 tableName: table,
                                 bundle: bundle,
                                 comment: String())
    }
}
