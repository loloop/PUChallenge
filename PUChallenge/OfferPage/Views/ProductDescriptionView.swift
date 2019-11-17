//
//  ProductDescriptionView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class ProductDescriptionView: UIView {

    private struct Margins {
           static let top: CGFloat = 10
           static let leading: CGFloat = 10
           static let bottom: CGFloat = -10
           static let trailing: CGFloat = -10
       }

    lazy var dealName: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        return view
    }()

    private lazy var dealNameConstraints: [NSLayoutConstraint] = [
        dealName.topAnchor.constraint(equalTo: topAnchor, constant: Margins.top),
        dealName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margins.leading),
        dealName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Margins.bottom)
    ]

    lazy var dealPrice: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 2
        return view
    }()

    private lazy var dealPriceConstraints: [NSLayoutConstraint] = [
        dealPrice.topAnchor.constraint(equalTo: topAnchor, constant: Margins.top),
        dealPrice.leadingAnchor.constraint(equalTo: dealName.trailingAnchor, constant: Margins.leading),
        dealPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Margins.trailing),
        dealPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Margins.bottom),
        dealPrice.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
    ]

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProductDescriptionView: CodableView {
    func setupViewHierarchy() {
        addSubviews([
            dealName,
            dealPrice
        ])
    }
    func setupConstraints() {
        addConstraints([
            dealNameConstraints,
            dealPriceConstraints
        ])
    }
}
