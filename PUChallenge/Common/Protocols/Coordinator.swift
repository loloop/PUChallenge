//
//  Coordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol TabbedCoordinator: Coordinator {
    func startController() -> UIViewController
}
