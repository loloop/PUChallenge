//
//  ProductCollectionViewCellViewModel+Deal.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension ProductCollectionViewCellViewModel {
    init(deal: Deal) {
        // TODO: stringsdict
        let attributedString = NSMutableAttributedString(string: "A partir de", attributes: [.foregroundColor: UIColor.gray])
        let priceString = NSAttributedString(string: "\n\(deal.salePrice)", attributes: [.foregroundColor: UIColor.secondary])
        attributedString.append(priceString)

        self = Self.init(imageURL: URL(string: deal.dealImage),
                  partnerName: deal.partner.name,
                  isFavorited: false,
                  isTop: false,
                  dealName: deal.title,
                  dealPrice: attributedString)
    }
}
