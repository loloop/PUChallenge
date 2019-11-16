//
//  CitiesViewController.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class OfferPageViewController: UIViewController {

    private let service: OfferPageServiceProtocol

    init(service: OfferPageServiceProtocol = CitiesService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = LoadingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData() {
        service.fetchData { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.setupView(for: model.response)
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self?.setupError()
                }
            }
        }
    }

    func setupView(for page: OfferPage) {
        let viewModel = CitiesViewModel(offerPage: page)
        view = OfferPageView(viewModel: viewModel)
    }

    func setupError() {
        // view = ErrorView(delegate: self)
    }

}
