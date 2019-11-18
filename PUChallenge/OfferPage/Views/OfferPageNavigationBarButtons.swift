//
//  OfferPageNavigationBarButtons.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class OfferPageNavigationBarButtons: UIView {

    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 20
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OfferPageNavigationBarButtons: CodableView {
    func setupViewHierarchy() {
        addSubview(stack)
    }

    func setupConstraints() {
        addConstraints([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configureViews() {
         [
            UIImageView(image: UIImage(named: "slider")),
            UIImageView(image: UIImage(named: "heart")),
            UIImageView(image: UIImage(named: "cart"))
            ].forEach { view in
                view.tintColor = .white
                stack.addArrangedSubview(view)
        }
    }
}
