//
//  OfferPage.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct OfferPage: Codable {
    let hasMore: Bool
    let banners: [Banner]
    let categories: [Category]
    let deals: [Deal]
}
