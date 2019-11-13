//
//  ImageDownloader.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

protocol ImageDownloaderProtocol {

}

final class ImageDownloader {

    private var shouldLoadFromCache: Bool {
        return true
    }

    func loadImage(completion: @escaping (UIImage) -> Void) {

    }

    private func loadImageFromCache(){}
    private func loadImageFrom(url: URL) {}

}
