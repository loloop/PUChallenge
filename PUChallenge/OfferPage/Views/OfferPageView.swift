//
//  CitiesView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

protocol CitiesViewModelProtocol {
    var sections: [Section] { get }
}

final class CitiesViewModel: CitiesViewModelProtocol {

    let sections: [Section]

    init(sections: [Section]) {
        self.sections = sections
    }

}

extension CitiesViewModel {
    convenience init(offerPage: OfferPage) {
        self.init(sections: [
            OfferPageDealSection(deals: offerPage.deals)
        ])
    }
}

final class OfferPageView: UIView {

    private let viewModel: CitiesViewModelProtocol

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        if self.traitCollection.horizontalSizeClass == .compact {
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 250)
        } else {
            layout.minimumInteritemSpacing = 1
            layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 3) - 10, height: 250)
        }
        let view = CollectionView(sections: viewModel.sections, layout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var collectionViewConstraints: [NSLayoutConstraint] = [
        collectionView.topAnchor.constraint(equalTo: topAnchor),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ]

    init(viewModel: CitiesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OfferPageView: CodableView {
    func setupViewHierarchy() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        addConstraints(collectionViewConstraints)
    }

    func configureViews() {
        if #available(iOS 13.0, *) {
            collectionView.backgroundColor = .systemBackground
        } else {
            collectionView.backgroundColor = .background
        }
        collectionView.reloadData()
    }
}
