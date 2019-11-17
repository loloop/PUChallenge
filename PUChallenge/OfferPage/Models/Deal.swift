//
//  Deal.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct Deal: Codable {
    let dealId: String
    let contractNumber: String
    let contractId: String
    let dealType: String
    let dealCategory: String
    let pageId: String
    let title: String
    let highlights: String
    let partner: Partner
    let dealImage: String
    let dealCity: String
    let salePrice: Double
}

struct Partner: Codable {
    let name: String
}
