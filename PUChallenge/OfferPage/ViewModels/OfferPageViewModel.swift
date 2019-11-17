//
//  OfferPageViewModel.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation
import Common

final class OfferPageViewModel {
    let sections: [Section]
    let title: String

    init(sections: [Section], title: String) {
        self.sections = sections
        self.title = title
    }
}
