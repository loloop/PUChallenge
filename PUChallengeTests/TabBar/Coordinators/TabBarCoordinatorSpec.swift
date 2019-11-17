//
//  TabBarCoordinatorSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class TabBarCoordinatorSpec: QuickSpec {
    override func spec() {
        describe("TabBarCoordinator") {

            var sut: TabBarCoordinator!
            var fakeVC: FakeUIViewController!

            context("given its Coordinator implementation") {

                beforeEach {
                    fakeVC = FakeUIViewController()
                    sut = TabBarCoordinator(controller: fakeVC)
                }

                context("when calling start") {

                    beforeEach {
                        sut.start()
                    }

                    it("has to configure itself") {
                        expect(sut.tabBarController.modalPresentationStyle) == .overFullScreen
                        expect(sut.tabBarController.modalTransitionStyle) == .crossDissolve
                        expect(sut.tabBarController.viewControllers?.count) == 3
                    }

                    it("has to show itself") {
                        expect(fakeVC.didCallShow) == true
                    }
                }
            }

        }
    }
}
