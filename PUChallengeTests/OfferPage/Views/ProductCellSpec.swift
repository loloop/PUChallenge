//
//  ProductCellSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/18/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import PUChallenge

final class ProductCellSpec: QuickSpec {
    override func spec() {
        describe("ProductCell") {
            var sut: ProductCell!

            context("when laying itself out") {

                beforeEach {
                    let attributedString = NSMutableAttributedString(string: "A partir de\n",
                    attributes: [.foregroundColor: UIColor.gray])
                    let priceString = NSAttributedString(string: "R$ 49,90",
                                                         attributes: [.foregroundColor: UIColor.secondary])
                    attributedString.append(priceString)

                    sut = ProductCell()
                    sut.setupCell(viewModel:
                        ProductCellViewModel(imageURL: ImageHelper.getURLForImage(named: "gasly"),
                                             partnerName: "Pierre Gasly on Podium",
                                             isFavorited: false,
                                             isTop: false,
                                             dealName: "Rodizio de Carnes Completo com Buffet pra até 2 pessoas",
                                             dealPrice: attributedString))
                    sut.setDynamicFrame()
                }

                it("has to have the correct layout") {
                    expect(sut).toEventually(haveValidSnapshot())
                }
            }
        }
    }
}
