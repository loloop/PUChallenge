//
//  ProductImageViewSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class ProductImageViewSpec: QuickSpec {
    override func spec() {
        describe("ProductImageView") {

            var sut: ProductImageView!

            context("when laying itself out") {

                beforeEach {
                    sut = ProductImageView(frame: CGRect(x: 0, y: 0, width: 414, height: 200))
                    let image = ImageHelper.getURLForImage(named: "gasly")!
                    sut.setupView(title: "Pierre Gasly on Podium", image: image)
                }

                it("has to lay itself out correctly") {
                    expect(sut).toEventually(recordSnapshot())
                }

            }
        }
    }
}
