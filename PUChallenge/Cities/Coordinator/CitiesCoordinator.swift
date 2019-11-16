//
//  CitiesCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class CitiesCoordinator: TabbedCoordinator {

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
        // TODO: stringsdict and iOS 12
        let cities = OfferPageViewController()
        if #available(iOS 13.0, *) {
            cities.tabBarItem = UITabBarItem(title: "Na cidade",
                                             image: UIImage(systemName: "house"),
                                             selectedImage: UIImage(systemName: "house.fill"))
        } else {
            cities.tabBarItem = UITabBarItem(title: "Na cidade", image: nil, selectedImage: nil)
        }
        return UINavigationController(rootViewController: cities)
    }

}
