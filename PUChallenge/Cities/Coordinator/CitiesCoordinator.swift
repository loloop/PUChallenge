//
//  CitiesCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

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
        let cities = CitiesViewController()
        cities.tabBarItem = UITabBarItem(title: "jiripoca", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        return cities
    }

}
