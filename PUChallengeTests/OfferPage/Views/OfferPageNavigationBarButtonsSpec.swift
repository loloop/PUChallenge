//
//  OfferPageNavigationBarButtonsSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/18/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class OfferPageNavigationBarButtonsSpec: QuickSpec {
    override func spec() {
        describe("OfferPageNavigationBarButtons") {
            var sut: OfferPageNavigationBarButtons!

            context("when laying itself out") {

                beforeEach {
                    sut = OfferPageNavigationBarButtons()
                    sut.frame = CGRect(x: 0, y: 0, width: 110, height: 21)
                }

                it("has to have the correct layout") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
