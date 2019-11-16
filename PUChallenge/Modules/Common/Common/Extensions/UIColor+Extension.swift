//
//  UIColor+Extension.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension UIColor {
    public static var primary: UIColor {
        color(for: "primary")
    }

    public static var secondary: UIColor {
        color(for: "secondary")
    }

    public static var top: UIColor {
        color(for: "top")
    }

    public static var favorite: UIColor {
        color(for: "favorite")
    }

    public static var background: UIColor {
        .white
    }

    private static func color(for name: String) -> UIColor {
        guard let color = UIColor(named: name, in: Bundle(identifier: "me.mauriciocardozo.Common"), compatibleWith: UIScreen.main.traitCollection) else {
            fatalError("color name mismatch for \(name)")
        }
        return color
    }
}
