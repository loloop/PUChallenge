//
//  Mobile.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct Mobile: Codable {
    let pages: [String]
    let mobileImage: String
    let type: Int
    let link: String
    let tagMarketing: String
    let collections: String
    let category: String
    let subcategories: String
    let regions: String
    let attributes: String
    let active: Bool
    let isActivation: Bool
}
