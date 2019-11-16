//
//  Category.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct Category: Codable {
    let slug: String
    let name: String
    let title: String
    let description: String
    let order: Int
    let parent: String
    let ancestors: [String]
    let visible: Bool
    let website: Bool
    let mobile: Bool
    let icon: String?
    let image: String?
    let phoenixCategory: String?
    let children: [Category]
    let childrenSlugs: [String]
    let aliases: [String]
    let enabledDomain: [String]
}
