//
//  ProductCollectionViewCellViewModel+Deal.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension ProductCellViewModel {
    init(deal: Deal) {
        // TODO: stringsdict
        let attributedString = NSMutableAttributedString(string: "A partir de\n",
                                                         attributes: [.foregroundColor: UIColor.gray])

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        if let formattedString = formatter.string(from: deal.salePrice as NSNumber) {
            let priceString = NSAttributedString(string: formattedString,
                                                 attributes: [.foregroundColor: UIColor.secondary])
            attributedString.append(priceString)
        }

        self = Self.init(imageURL: URL(string: deal.dealImage),
                  partnerName: deal.partner.name,
                  isFavorited: false,
                  isTop: false,
                  dealName: deal.title,
                  dealPrice: attributedString)
    }
}
