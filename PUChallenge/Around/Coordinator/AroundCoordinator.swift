//
//  AroundCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class AroundCoordinator: TabbedCoordinator {

    private let rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    init() {
        rootViewController = nil
    }

    func start() {
        rootViewController?.show(startController(), sender: nil)
    }

    func startController() -> UIViewController {
        let controller = UINavigationController()
        controller.tabBarItem = UITabBarItem(title: AroundStrings.tabBarTitle,
                                             image: UIImage(named: "location"),
                                             selectedImage: UIImage(named: "location.fill"))
        return controller
    }
}
