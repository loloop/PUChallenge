//
//  UIView+DynamicFrame.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/16/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension UIView {
    func setDynamicFrame() {
        let iPhoneXRWidth: CGFloat = 414

        let cellSize = self.systemLayoutSizeFitting(CGSize(width: iPhoneXRWidth, height: 1000), withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.fittingSizeLevel)
        self.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: CGFloat(iPhoneXRWidth), height: cellSize.height))
    }
}
