//
//  ProductCollectionViewCell.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class ProductCollectionViewCell: UICollectionViewCell {

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
        productImage.bottomAnchor.constraint(equalTo: deal.topAnchor),
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

    // extract this to another view
    // this wont work for ios 12 i think
    private lazy var favoriteButton: UIButton = {
        let view = UIButton()

        // TODO: make single iOS12 supportable image
        if #available(iOS 13.0, *) {
            let configuration = UIImage.SymbolConfiguration(scale: UIImage.SymbolScale.medium)
            let heart = UIImage(systemName: "heart")?
                            .withTintColor(.white, renderingMode: .alwaysTemplate)
                            .withConfiguration(configuration)
            view.setImage(heart, for: .normal)

            let filledHeart = UIImage(systemName: "heart.fill")?
                                .withTintColor(.white, renderingMode: .alwaysTemplate)
                                .withConfiguration(configuration)


            view.setImage(filledHeart, for: .selected)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        return view
    }()

    private lazy var favoriteButtonConstraints: [NSLayoutConstraint] = [
        favoriteButton.leadingAnchor.constraint(equalTo: partnerName.trailingAnchor),
        favoriteButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: Margins.trailing),
        favoriteButton.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: Margins.bottom)
    ]

    private lazy var deal: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dealConstraints: [NSLayoutConstraint] = [
        deal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        deal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        deal.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        deal.widthAnchor.constraint(equalTo: contentView.widthAnchor)
    ]

    private lazy var dealName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        return view
    }()

    private lazy var dealNameConstraints: [NSLayoutConstraint] = [
        dealName.topAnchor.constraint(equalTo: deal.topAnchor, constant: Margins.top),
        dealName.leadingAnchor.constraint(equalTo: deal.leadingAnchor, constant: Margins.leading),
        dealName.bottomAnchor.constraint(equalTo: deal.bottomAnchor, constant: Margins.bottom)
    ]

    private lazy var dealPrice: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dealPriceConstraints: [NSLayoutConstraint] = [
        dealPrice.topAnchor.constraint(equalTo: deal.topAnchor, constant: Margins.top),
        dealPrice.leadingAnchor.constraint(equalTo: dealName.trailingAnchor, constant: Margins.leading),
        dealPrice.trailingAnchor.constraint(equalTo: deal.trailingAnchor, constant: Margins.trailing),
        dealPrice.bottomAnchor.constraint(equalTo: deal.bottomAnchor, constant: Margins.bottom)
    ]

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(viewModel: ProductCollectionViewCellViewModel) {
        productImage.downloadImage(url: viewModel.imageURL)
        partnerName.text = viewModel.partnerName
        favoriteButton.isSelected = viewModel.isFavorited
        dealName.text = viewModel.dealName
        dealPrice.attributedText = viewModel.dealPrice
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

extension ProductCollectionViewCell: CodableView {
    func setupViewHierarchy() {
        contentView.addSubviews([
            productImage,
            partnerName,
            favoriteButton,
            deal
        ])

        deal.addSubviews([
            dealName,
            dealPrice
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
            dealConstraints
        ])

        deal.addConstraints([
            dealNameConstraints,
            dealPriceConstraints
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
