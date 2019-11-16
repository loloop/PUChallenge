//
//  ProductsCoordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit
import Common

final class ProductsCoordinator: TabbedCoordinator {

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
        let products = OfferPageViewController(service: ProductsService())
        products.tabBarItem = UITabBarItem(title: "Produtos",
                                           image: UIImage(named: "bag"),
                                           selectedImage: UIImage(named: "bag.fill"))
        return UINavigationController(rootViewController: products)
    }

}
