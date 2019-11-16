//
//  TripsCoordinatorSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
@testable import PUChallenge

final class TripsCoordinatorSpec: QuickSpec {
    override func spec() {
        describe("TripsCoordinator") {
            var sut: TripsCoordinator!
            var fakeVC: FakeUIViewController!

            context("given its TabbedCoordinator implementation") {

                beforeEach {
                    fakeVC = FakeUIViewController()
                    sut = TripsCoordinator(rootViewController: fakeVC)
                }

                context("when accessing its startController") {

                    var controller: UIViewController!

                    beforeEach {
                        controller = sut.startController()
                    }

                    it("has to return a properly configured controller") {
                        expect(controller).to(beAKindOf(UINavigationController.self))
                        expect(controller.children.first).to(beAKindOf(OfferPageViewController.self))
                        expect(controller.tabBarItem.image).notTo(beNil())
                        expect(controller.tabBarItem.title) == "Viagens"
                    }
                }

                context("when calling start") {

                    beforeEach {
                        sut.start()
                    }

                    it("has to call its rootViewController's show") {
                        expect(fakeVC.didCallShow) == true
                    }
                }
            }
        }
    }
}
