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
        // TODO: stringsdict and iOS 12
        let products = OfferPageViewController(service: ProductsService())
        if #available(iOS 13.0, *) {
            products.tabBarItem = UITabBarItem(title: "Produtos", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        } else {
            products.tabBarItem = UITabBarItem(title: "Viagens", image: nil, selectedImage: nil)
        }
        return UINavigationController(rootViewController: products)
    }

}
