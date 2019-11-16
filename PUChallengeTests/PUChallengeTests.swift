//
//  PUChallengeTests.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class OfferPageViewControllerSpec: QuickSpec {
    override func spec() {
        describe("OfferPageView") {
            var sut: OfferPageView!

            context("just testing a snapshot") {
                beforeEach {
                    let section = OfferPageDealSection(cells: [
                        ProductCollectionViewCellViewModel(imageURL: nil, partnerName: "", isFavorited: true, isTop: true, dealName: "", dealPrice: NSAttributedString(string: ""))
                    ])

                    sut = OfferPageView(viewModel: CitiesViewModel(sections: [section]))
                    sut.setDynamicFrame()
                }

                it("should snapshot") {
                    expect(sut).to(recordSnapshot())
                }
            }

            context("another test") {
                var coordinator: CitiesCoordinator!

                beforeEach {
                    coordinator = CitiesCoordinator()
                }

                it("shbould test") {
                    expect(coordinator.startController().tabBarItem.title) == "Na cidade"
                }
            }
        }
    }
}
