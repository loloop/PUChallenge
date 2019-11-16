//
//  OfferPageServiceProtocol.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

protocol OfferPageServiceProtocol {
    func fetchData(completion: @escaping (Result<BaseAPIModel<OfferPage>, NetworkError>) -> Void)
}
