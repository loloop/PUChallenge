//
//  CitiesView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class OfferPageView: UIView {

    private let viewModel: OfferPageViewModel

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 250)
        layout.minimumLineSpacing = 0
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

    init(viewModel: OfferPageViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OfferPageView: ViewConfiguration {
    func setupViewHierarchy() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        addConstraints(collectionViewConstraints)
    }

    func configureViews() {
        collectionView.backgroundColor = .background
        collectionView.reloadData()
    }
}
