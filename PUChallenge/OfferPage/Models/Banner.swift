//
//  Banner.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct Banner: Codable {
    let name: String
    let title: String
    let label: String
    let priority: Int
    let startDate: String
    let endDate: String
    let mobile: Mobile
    let isIos: Bool
    let isAndroid: Bool
}
