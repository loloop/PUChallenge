//
//  ErrorView.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

public protocol ErrorViewDelegate: AnyObject {
    func didTapTryAgainButton()
}

public final class ErrorView: UIView {

    private struct Margins {
        static var borderWidth: CGFloat = 1
        static var cornerRadius: CGFloat = 20
        static var padding: CGFloat = 5
        static var width: CGFloat = 200
    }

    private lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.secondary.cgColor
        button.layer.borderWidth = Margins.borderWidth
        button.layer.cornerRadius = Margins.cornerRadius
        button.setTitle("Tentar novamente", for: .normal)
        button.setTitleColor(.secondary, for: .normal)
        button.addTarget(self, action: #selector(didTapTryAgainButton), for: .touchUpInside)
        return button
    }()

    private lazy var tryAgainButtonConstraints: [NSLayoutConstraint] = [
        tryAgainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        tryAgainButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        tryAgainButton.widthAnchor.constraint(equalToConstant: Margins.width)
    ]

    private weak var delegate: ErrorViewDelegate?

    public init(delegate: ErrorViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc private func didTapTryAgainButton() {
        delegate?.didTapTryAgainButton()
    }
}

extension ErrorView: CodableView {

    public func setupViewHierarchy() {
        addSubview(tryAgainButton)
    }

    public func setupConstraints() {
        addConstraints(tryAgainButtonConstraints)
    }

    public func configureViews() {
        backgroundColor = .background
    }
}
