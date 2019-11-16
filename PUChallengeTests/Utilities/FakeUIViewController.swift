//
//  FakeUIViewController.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

final class FakeUIViewController: UIViewController {

    private(set) var didCallShow: Bool = false
    private(set) var showedViewController: UIViewController?

    override func show(_ vc: UIViewController, sender: Any?) {
        didCallShow = true
        showedViewController = vc
    }
}
