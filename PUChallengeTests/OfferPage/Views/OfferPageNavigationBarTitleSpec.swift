//
//  OfferPageNavigationBarTitleSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/18/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class OfferPageNavigationBarTitleSpec: QuickSpec {
    override func spec() {
        describe("OfferPageNavigationBarTitle") {
            var sut: OfferPageNavigationBarTitle!

            context("when laying itself out") {

                beforeEach {
                    sut = OfferPageNavigationBarTitle(title: "Florianópolis")
                    sut.frame = CGRect(x: 0, y: 0, width: 140, height: 21)
                }

                it("has to have the correct layout") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
