//
//  OfferPageDealSectionSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class OfferPageDealSectionSpec: QuickSpec {
    override func spec() {
        describe("OfferPageDealSection") {

            var sut: OfferPageDealSection!
            var fakeCollection: UICollectionViewSpy!

            context("given it is being initialized") {
                context("when a ProductCollectionViewModel array is passed") {

                    beforeEach {
                        let viewModel = ProductCollectionViewCellViewModel(imageURL: nil, partnerName: "", isFavorited: false, isTop: false, dealName: "Teste 3 2 1", dealPrice: NSAttributedString())

                        sut = OfferPageDealSection(cells: [viewModel])
                    }

                    it("has to assign that array to itself") {
                        expect(sut.cells).notTo(beEmpty())
                        expect(sut.cells[0].dealName) == "Teste 3 2 1"
                    }
                }

                context("when a Deal array is passed") {
                    beforeEach {
                        let deal = Deal(dealId: "", contractNumber: "", contractId: "", dealType: "", dealCategory: "", pageId: "", title: "Teste 1 2 3", highlights: "", partner: Partner(name: "Robson"), dealImage: "https://google.com", dealCity: "", salePrice: 15.50)

                        sut = OfferPageDealSection(deals: [deal])
                    }

                    it("has to map the deal array into a ProductCollectionViewModel array") {
                        expect(sut.cells).notTo(beEmpty())
                        expect(sut.cells[0].dealName) == "Teste 1 2 3"
                    }
                }
            }

            context("given its Section implementation") {

                beforeEach {
                    let viewModel = ProductCollectionViewCellViewModel(imageURL: nil, partnerName: "", isFavorited: false, isTop: false, dealName: "Teste 3 2 1", dealPrice: NSAttributedString())

                    sut = OfferPageDealSection(cells: [viewModel, viewModel])
                }

                context("when calling numberOfItemsInSection") {
                    it("has to return the number of cells") {
                        expect(sut.numberOfItemsInSection()) == 2
                    }
                }

                context("when calling cellForItemAt") {

                    beforeEach {
                        fakeCollection = UICollectionViewSpy()
                        sut.register(fakeCollection)
                    }

                    it("has to dequeue the cell and return it") {
                        let cell = sut.collectionView(fakeCollection, cellForItemAt: IndexPath(item: 0, section: 0))
                        expect(cell).to(beAKindOf(ProductCollectionViewCell.self))
                        expect(fakeCollection.didDequeueCell) == true
                    }
                }

                context("when calling register") {

                    beforeEach {
                        fakeCollection = UICollectionViewSpy()
                        sut.register(fakeCollection)
                    }

                    it("has to register a cell of type ProductCollectionViewCell on the collectionView") {
                        expect(fakeCollection.didRegisterCell) == true
                        expect(fakeCollection.registeredCellIdentifier) == "ProductCollectionViewCell"
                    }
                }
            }
        }
    }
}
