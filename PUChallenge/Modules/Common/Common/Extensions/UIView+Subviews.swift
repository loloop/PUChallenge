//
//  UIView+Subviews.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/14/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension UIView {
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }

    public func addConstraints(_ constraints: [[NSLayoutConstraint]]) {
        constraints.forEach(addConstraints(_:))
    }
}
