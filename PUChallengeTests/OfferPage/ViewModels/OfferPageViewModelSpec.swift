//
//  OfferPageViewModelSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/18/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class OfferPageViewModelSpec: QuickSpec {
    override func spec() {
        describe("OfferPageViewModel") {
            var sut: OfferPageViewModel!

            context("given it is being initialized with an OfferPage") {

                beforeEach {
                    let offer = OfferPage(hasMore: false, banners: [], categories: [], deals: [
                        Deal(dealId: "", contractNumber: "", contractId: "", dealType: "", dealCategory: "", pageId: "", title: "Churrasco", highlights: "", partner: Partner(name: "Robson"), dealImage: "https://google.com", dealCity: "Florianópolis", salePrice: 15.50)
                    ])
                    sut = OfferPageViewModel(offerPage: offer)
                }

                it("has to get the first deal's city and assign it to it's title") {
                    expect(sut.title) == "Florianópolis"
                }

                it("has to initialize its sections") {
                    expect(sut.sections[0]).to(beAKindOf(OfferPageDealSection.self))
                }
            }
        }
    }
}
