//
//  CodableView.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

public protocol ViewConfiguration {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {

    public func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }

    public func configureViews() { }

}
