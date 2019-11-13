//
//  Coordinator.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

public protocol Coordinator {
    func start()
}

public protocol TabbedCoordinator: Coordinator {
    func startController() -> UIViewController
}
