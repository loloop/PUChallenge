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
        // TODO: stringsdict and iOS 12
        let trips = OfferPageViewController(service: TripsService())
        if #available(iOS 13.0, *) {
            trips.tabBarItem = UITabBarItem(title: "Viagens", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        } else {
            // Fallback on earlier versions
            trips.tabBarItem = UITabBarItem(title: "Viagens", image: nil, selectedImage: nil)
        }
        return UINavigationController(rootViewController: trips)
    }

}
