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

    private lazy var productImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private lazy var productImageConstraints: [NSLayoutConstraint] = [
        productImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        productImage.bottomAnchor.constraint(equalTo: productDescription.topAnchor),
        productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor)
    ]

    private lazy var partnerName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        return view
    }()

    private lazy var partnerNameConstraints: [NSLayoutConstraint] = [
        partnerName.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: Margins.leading),
        partnerName.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: Margins.bottom)
    ]

    // TODO: extract this to another view, as it needs that background circle too
    private lazy var favoriteButton: UIButton = {
        let view = UIButton()
        let heart = UIImage(named: "heart")
        view.setImage(heart, for: .normal)
        let filledHeart = UIImage(named: "heart.fill")
        view.setImage(filledHeart, for: .selected)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        return view
    }()

    private lazy var favoriteButtonConstraints: [NSLayoutConstraint] = [
        favoriteButton.leadingAnchor.constraint(equalTo: partnerName.trailingAnchor),
        favoriteButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: Margins.trailing),
        favoriteButton.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: Margins.bottom)
    ]

    private lazy var productDescription: ProductDescriptionView = {
        let view = ProductDescriptionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var productDescriptionConstraints: [NSLayoutConstraint] = [
        productDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        productDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
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
        productImage.downloadImage(url: viewModel.imageURL)
        partnerName.text = viewModel.partnerName
        favoriteButton.isSelected = viewModel.isFavorited
        productDescription.dealName.text = viewModel.dealName
        productDescription.dealPrice.attributedText = viewModel.dealPrice
    }

    @objc private func didTapHeartButton() {
        favoriteButton.isSelected.toggle()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setupShadow()
    }

    func setupShadow() {
        guard productImage.layer.sublayers == nil else {
            return
        }

        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.locations = [0.5, 1.0]
        layer.frame = productImage.frame
        layer.opacity = 0.4
        productImage.layer.addSublayer(layer)
    }
}

extension ProductCell: CodableView {
    func setupViewHierarchy() {
        contentView.addSubviews([
            productImage,
            partnerName,
            favoriteButton,
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
            partnerNameConstraints,
            favoriteButtonConstraints,
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
