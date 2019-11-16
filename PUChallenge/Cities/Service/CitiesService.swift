//
//  CitiesService.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

final class CitiesService: OfferPageServiceProtocol {

    private let client: APIClientProtocol
    //swiftlint:disable:next line_length
    private let endpoint: URL? = URL(string: "https://gist.githubusercontent.com/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json")

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
