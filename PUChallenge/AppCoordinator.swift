//
//  AppCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private var child: Coordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let controller = UIViewController()
        window.rootViewController = controller
        window.makeKeyAndVisible()
        child = TabBarCoordinator(controller: controller)
        child?.start()
    }
}
