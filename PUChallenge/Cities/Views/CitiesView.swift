//
//  CitiesView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class CitiesView: UIView {

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CitiesView: CodableView {
    func setupViewHierarchy() {

    }

    func setupConstraints() {

    }

    func configureViews() {
        backgroundColor = .cyan
    }
}
