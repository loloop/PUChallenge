//
//  TabBarControllerSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class TabBarControllerSpec: QuickSpec {
    override func spec() {
        describe("TabBarController") {
            var sut: TabBarController!

            context("when it's initialized") {

                beforeEach {
                    sut = TabBarController()
                }

                it("has to configure its appearance") {
                    expect(sut.view.tintColor) == .secondary
                }
            }
        }
    }
}
