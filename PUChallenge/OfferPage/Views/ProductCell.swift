//
//  ProductCollectionViewCell.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class ProductCell: UICollectionViewCell {

    private struct Margins {
        static let top: CGFloat = 10
        static let leading: CGFloat = 10
        static let bottom: CGFloat = -10
        static let trailing: CGFloat = -10
        static let favorite: CGFloat = 64
    }

    private lazy var productImage: ProductImageView = {
        let view = ProductImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var productImageConstraints: [NSLayoutConstraint] = [
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        productImage.bottomAnchor.constraint(equalTo: productDescription.topAnchor)
    ]

    private lazy var productDescription: ProductDescriptionView = {
        let view = ProductDescriptionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var productDescriptionConstraints: [NSLayoutConstraint] = [
        productDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        productDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ]

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(viewModel: ProductCellViewModel) {
        productImage.setupView(title: viewModel.partnerName,
                               image: viewModel.imageURL,
                               isFavorited: viewModel.isFavorited)

        productDescription.dealName.text = viewModel.dealName
        productDescription.dealPrice.attributedText = viewModel.dealPrice
    }
}

extension ProductCell: CodableView {
    func setupViewHierarchy() {
        contentView.addSubviews([
            productImage,
            productDescription
        ])
    }

    func setupConstraints() {
        addConstraints([
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentView.heightAnchor.constraint(equalTo: heightAnchor)
        ])

        contentView.addConstraints([
            productImageConstraints,
            productDescriptionConstraints
        ])
    }

    func configureViews() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = .background
        }
    }
}
