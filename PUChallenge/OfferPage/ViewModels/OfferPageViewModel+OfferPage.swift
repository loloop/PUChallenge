//
//  OfferPageViewModel+OfferPage.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

extension OfferPageViewModel {
    convenience init(offerPage: OfferPage) {
        let title = offerPage.deals.first?.dealCity ?? ""
        self.init(sections: [
            OfferPageDealSection(deals: offerPage.deals)
        ], title: title)
    }
}
