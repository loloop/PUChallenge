//
//  ProductDescriptionViewSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class ProductDescriptionViewSpec: QuickSpec {
    override func spec() {
        describe("ProductDescriptionView") {

            var sut: ProductDescriptionView!

            context("when laying itself out") {

                beforeEach {
                    sut = ProductDescriptionView()
                    sut.dealName.text = "Rodizio de Carnes Completo com Buffet pra até 2 pessoas"
                    let attributedString = NSMutableAttributedString(string: "A partir de\n",
                    attributes: [.foregroundColor: UIColor.gray])
                    let priceString = NSAttributedString(string: "R$ 49,90",
                                                         attributes: [.foregroundColor: UIColor.secondary])
                    attributedString.append(priceString)

                    sut.dealPrice.attributedText = attributedString
                    sut.setDynamicFrame()
                }

                it("has to have the correct layout") {
                    expect(sut).to(haveValidSnapshot())
                }
            }
        }
    }
}
