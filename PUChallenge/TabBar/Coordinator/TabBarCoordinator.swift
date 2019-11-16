//
//  TabBarCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class TabBarCoordinator: Coordinator {

    private let rootViewController: UIViewController
    private lazy var tabBarController = TabBarController()
    private lazy var coordinators: [TabbedCoordinator] = [
        CitiesCoordinator(),
        TripsCoordinator(),
        ProductsCoordinator()
    ]

    init(controller: UIViewController) {
        self.rootViewController = controller
    }

    func start() {
        configureTabs()
        tabBarController.modalPresentationStyle = .overFullScreen
        tabBarController.modalTransitionStyle = .crossDissolve
        rootViewController.show(tabBarController, sender: nil)
    }

    func configureTabs() {
        let controllers = coordinators.map { $0.startController() }
        tabBarController.setViewControllers(controllers, animated: false)
    }

}
