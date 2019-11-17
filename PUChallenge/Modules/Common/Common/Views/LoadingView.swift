//
//  LoadingView.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

public final class LoadingView: UIView {

    private lazy var loadingConstraints: [NSLayoutConstraint] = [
        activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ]

    private lazy var activityView: UIActivityIndicatorView = {
        let view: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            view = UIActivityIndicatorView(style: .medium)
        } else {
            view = UIActivityIndicatorView(style: .gray)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public init() {
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoadingView: CodableView {
    public func setupViewHierarchy() {
        addSubview(activityView)
    }

    public func setupConstraints() {
        addConstraints(loadingConstraints)
    }

    public func configureViews() {
        activityView.startAnimating()

        if #available(iOS 13.0, *) {
            backgroundColor = .systemBackground
        } else {
            backgroundColor = .background
        }
    }
}
