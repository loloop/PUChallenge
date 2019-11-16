//
//  OfferPageDealSection+Deals.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

extension OfferPageDealSection {
    convenience init(deals: [Deal]) {
        let cells: [ProductCollectionViewCellViewModel] = deals.map { deal in
            ProductCollectionViewCellViewModel(deal: deal)
        }
        self.init(cells: cells)
    }
}
