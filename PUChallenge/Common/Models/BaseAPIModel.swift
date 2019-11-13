//
//  BaseAPIModel.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct BaseAPIModel: Codable {
    let code: Int
    let response: Response
}

struct Response: Codable {
    let hasMore: Bool
    let banners: [Banner]
}

struct Banner: Codable {
    let name: String
    let title: String
    let label: String
    let priority: Int
    let startDate: String
    let endDate: String
    let mobile: Mobile
    let isiOS: Bool
    let isAndroid: Bool
}

struct Mobile: Codable {
    let pages: [String]
    let mobileImage: URL
    let type: Int
    let link: URL?
    let tagMarketing: String
    let collections: String
    let category: String
    let subcategories: String
    let regions: String
    let attributes: String
    let active: Bool
    let isActivation: Bool
}
