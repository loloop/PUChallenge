//
//  ProductImageView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

protocol ProductImageViewDelegate: AnyObject {
    func didTapFavoriteButton(isSelected: Bool)
}

final class ProductImageView: UIView {

    private struct Margins {
        static let top: CGFloat = 10
        static let leading: CGFloat = 10
        static let bottom: CGFloat = -10
        static let trailing: CGFloat = -10
        static let favorite: CGFloat = 50
        static let favoriteRadius: CGFloat = favorite/2
    }

    private lazy var productImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private lazy var productImageConstraints: [NSLayoutConstraint] = [
        productImage.topAnchor.constraint(equalTo: topAnchor),
        productImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        productImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        productImage.bottomAnchor.constraint(equalTo: bottomAnchor)
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

    private lazy var favoriteButton: UIButton = {
        let view = UIButton()
        let heart = UIImage(named: "heart")
        view.setImage(heart, for: .normal)
        let filledHeart = UIImage(named: "heart.fill")
        view.setImage(filledHeart, for: .selected)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(didTapHeartButton), for: .touchUpInside)
        view.backgroundColor = .favoriteBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = Margins.favoriteRadius
        return view
    }()

    private lazy var favoriteButtonConstraints: [NSLayoutConstraint] = [
        favoriteButton.leadingAnchor.constraint(equalTo: partnerName.trailingAnchor),
        favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Margins.trailing),
        favoriteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Margins.bottom),
        favoriteButton.widthAnchor.constraint(equalToConstant: Margins.favorite),
        favoriteButton.heightAnchor.constraint(equalToConstant: Margins.favorite)
    ]

    weak var delegate: ProductImageViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    func setupView(title: String, image: URL?, isFavorited: Bool) {
        partnerName.text = title
        productImage.downloadImage(url: image)
    }

    @objc private func didTapHeartButton() {
        favoriteButton.isSelected.toggle()

        if favoriteButton.isSelected {
            favoriteButton.setImage(UIImage(named: "heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "heart"), for: .normal)
        }

        delegate?.didTapFavoriteButton(isSelected: favoriteButton.isSelected)
    }
}

extension ProductImageView: CodableView {
    func setupViewHierarchy() {
        addSubviews([
            productImage,
            partnerName,
            favoriteButton
        ])
    }

    func setupConstraints() {
        addConstraints([
            productImageConstraints,
            partnerNameConstraints,
            favoriteButtonConstraints
        ])
    }
}
