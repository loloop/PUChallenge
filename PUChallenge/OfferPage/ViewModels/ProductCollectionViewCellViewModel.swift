//
//  ProductCollectionViewCellViewModel.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

struct ProductCollectionViewCellViewModel {
    let imageURL: URL?
    let partnerName: String
    let isFavorited: Bool
    let isTop: Bool
    let dealName: String
    let dealPrice: NSAttributedString

    init(imageURL: URL?, partnerName: String, isFavorited: Bool, isTop: Bool, dealName: String, dealPrice: NSAttributedString) {
        self.imageURL = imageURL
        self.partnerName = partnerName
        self.isFavorited = isFavorited
        self.isTop = isTop
        self.dealName = dealName
        self.dealPrice = dealPrice
    }
}
