//
//  TripsServiceSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

final class TripsServiceSpec: QuickSpec {
    override func spec() {
        describe("TripsService") {
            var sut: TripsService!

            context("given its OfferPageServiceProtocol implementation") {

                var api: APIClientMock!

                beforeEach {
                    api = APIClientMock()
                    sut = TripsService(client: api)
                    waitUntil { done in
                        sut.fetchData { _ in
                            done()
                        }
                    }
                }

                it("has to ask a client to fetch data") {
                    expect(api.didCallFetchData) == true
                }
            }

            context("when initializing") {
                context("and no APIClientProtocol was passed") {

                    beforeEach {
                        sut = TripsService()
                    }

                    it("has to create a default APIClient") {
                        expect(sut.client).to(beAKindOf(APIClient.self))
                    }
                }

                context("and an APIClientProtocol was passed") {

                    beforeEach {
                        sut = TripsService(client: APIClientMock())
                    }

                    it("has to assign that object to its client") {
                        expect(sut.client).to(beAKindOf(APIClientMock.self))
                    }
                }
            }

        }
    }
}
