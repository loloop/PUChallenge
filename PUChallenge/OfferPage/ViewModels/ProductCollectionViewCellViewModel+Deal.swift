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
        let attributedString = NSMutableAttributedString(string: ProductsStrings.fromPriceLabel,
                                                         attributes: [.foregroundColor: UIColor.gray,
                                                         .font: UIFont.systemFont(ofSize: 12)])

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        if let formattedString = formatter.string(from: deal.salePrice as NSNumber) {
            let priceString = NSAttributedString(string: formattedString,
                                                 attributes: [.foregroundColor: UIColor.secondary,
                                                              .font: UIFont.systemFont(ofSize: 14)])
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
