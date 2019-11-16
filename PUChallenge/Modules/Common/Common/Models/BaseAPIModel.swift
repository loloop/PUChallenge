//
//  BaseAPIModel.swift
//  Common
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

public struct BaseAPIModel<T>: Codable where T:Codable {
    public let code: Int
    public let response: T
}
