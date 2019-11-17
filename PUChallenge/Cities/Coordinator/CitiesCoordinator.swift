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
        // TODO: stringsdict
        let cities = OfferPageViewController()
        cities.tabBarItem = UITabBarItem(title: "Na cidade",
                                         image: UIImage(named: "house"),
                                         selectedImage: UIImage(named: "housefill"))
        return UINavigationController(rootViewController: cities)
    }

}
