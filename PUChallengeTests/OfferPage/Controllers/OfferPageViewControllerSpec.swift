//
//  OfferPageViewControllerSpec.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Quick
import Nimble
import Common
@testable import PUChallenge

private class ServiceMock: OfferPageServiceProtocol {

    var shouldLoad: Bool = true
    var shouldFail: Bool = false
    private(set) var didCallFetchData: Bool = false

    func fetchData(completion: @escaping (Result<BaseAPIModel<OfferPage>, NetworkError>) -> Void) {
        didCallFetchData = true
        guard shouldLoad else { return }

        if shouldFail {
            completion(.failure(.downloadError))
        } else {
            let model = BaseAPIModel(code: 0, response: OfferPage(hasMore: false, banners: [], categories: [], deals: []))
            completion(.success(model))
        }
    }
}

final class OfferPageViewControllerSpec: QuickSpec {
    override func spec() {
        describe("OfferPageViewController") {

            var sut: OfferPageViewController!
            var mock: ServiceMock!

            context("given it is initializing") {

                beforeEach {
                    mock = ServiceMock()
                    mock.shouldLoad = false
                    sut = OfferPageViewController(service: mock)
                }

                it("has to show a LoadingView") {
                    expect(sut.view).to(beAKindOf(LoadingView.self))
                }
            }

            context("given its view did load") {

                beforeEach {
                    mock = ServiceMock()
                    sut = OfferPageViewController(service: mock)
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }

                it("has to fetch data from the service") {
                    expect(mock.didCallFetchData) == true
                }
            }

            context("given the service has fetched data") {
                context("when fetching is a success") {

                    beforeEach {
                        mock = ServiceMock()
                        mock.shouldFail = false
                        sut = OfferPageViewController(service: mock)
                        sut.beginAppearanceTransition(true, animated: false)
                        sut.endAppearanceTransition()
                    }

                    it("has to show an OfferPageView") {
                        expect(sut.view).toEventually(beAKindOf(OfferPageView.self))
                    }
                }

                xcontext("when fetching returns an error") {

                    beforeEach {
                        mock = ServiceMock()
                        mock.shouldFail = false
                        sut = OfferPageViewController(service: mock)
                    }

                    it("has to show an error view") {
                        // expect(sut.view).to(beAKindOf(ErrorView.self))
                    }
                }
            }


        }
    }
}
