//
//  OfferPageNavigationBarTitle.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class OfferPageNavigationBarTitle: UIView {

    private let title: String

    private lazy var stack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 2
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    private lazy var chevron: UIImageView = {
        let image = UIImageView(image: UIImage(named: "chevron.down"))
        image.contentMode = .scaleAspectFit
        image.transform = image.transform.scaledBy(x: 0.5, y: 0.5)
        image.tintColor = .white
        return image
    }()

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OfferPageNavigationBarTitle: ViewConfiguration {
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
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(chevron)
    }
}
