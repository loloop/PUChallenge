//
//  TabBarController.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

final class TabBarController: UITabBarController {

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        configureTabBar()
    }

    func configureTabBar() {
        self.view.tintColor = .secondary
    }

}
