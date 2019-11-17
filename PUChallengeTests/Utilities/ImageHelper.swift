//
//  ImageHelper.swift
//  PUChallengeTests
//
//  Created by Mauricio Cardozo on 11/17/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import Foundation

class ImageHelper {

    class func getURLForImage(named fileName: String, ofType fileExtension: String = "jpg") -> URL? {
        guard let path = Bundle(for: ImageHelper.self).path(forResource: fileName, ofType: fileExtension) else { return nil }
        return URL(fileURLWithPath: path)
    }

}
