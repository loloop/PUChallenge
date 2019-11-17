//
//  ProductCollectionViewCellViewModelSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class ProductCollectionViewCellViewModelSpec: QuickSpec {
    override func spec() {
        describe("ProductCollectionViewCellViewModel") {
            var sut: ProductCollectionViewCellViewModel!

            context("given it is being initialized with a Deal") {

                beforeEach {
                    let deal = Deal(dealId: "", contractNumber: "", contractId: "", dealType: "", dealCategory: "", pageId: "", title: "Churrasco", highlights: "", partner: Partner(name: "Robson"), dealImage: "https://google.com", dealCity: "", salePrice: 15.50)

                    sut = ProductCollectionViewCellViewModel(deal: deal)
                }

                it("has to map a Deal to itself") {
                    expect(sut.imageURL?.absoluteString) == "https://google.com"
                    expect(sut.isFavorited) == false
                    expect(sut.isTop) == false
                    expect(sut.dealName) == "Churrasco"
                }
            }
        }
    }
}
