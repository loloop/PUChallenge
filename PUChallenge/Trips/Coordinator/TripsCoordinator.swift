//
//  TripsCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class TripsCoordinator: TabbedCoordinator {

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
        let trips = OfferPageViewController(service: TripsService())
        trips.tabBarItem = UITabBarItem(title: "Viagens", image: UIImage(named: "airplane"), selectedImage: nil)
        return UINavigationController(rootViewController: trips)
    }

}
