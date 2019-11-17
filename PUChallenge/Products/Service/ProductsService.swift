//
//  ProductsService.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/15/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

final class ProductsService: OfferPageServiceProtocol {

    let client: APIClientProtocol
    //swiftlint:disable:next line_length
    let endpoint: URL? = URL(string: "https://gist.githubusercontent.com/insidegui/007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json")

    init(client: APIClientProtocol? = nil) {
        if let client = client {
            self.client = client
        } else {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            self.client = APIClient(decoder: decoder)
        }
    }

    func fetchData(completion: @escaping (Result<BaseAPIModel<OfferPage>, NetworkError>) -> Void) {
        client.fetchData(from: endpoint, completion: completion)
    }

}
