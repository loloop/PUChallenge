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
        let cells: [ProductCellViewModel] = deals.map { deal in
            ProductCellViewModel(deal: deal)
        }
        self.init(cells: cells)
    }
}
