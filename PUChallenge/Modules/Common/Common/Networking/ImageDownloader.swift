//
//  ImageDownloader.swift
//  PUChallenge
//
//  Created by Mauricio Cardozo on 11/13/19.
//  Copyright © 2019 Mauricio Cardozo. All rights reserved.
//

import UIKit

extension UIImageView {
    public func downloadImage(url: URL?,
                              placeholder: UIImage? = UIImage(named: "pu-logo",
                                                              in: Bundle(identifier: "me.mauriciocardozo.Common"),
                                                              compatibleWith: UIScreen.main.traitCollection)) {
        self.image = placeholder
        let downloader = ImageDownloader()
        downloader.loadImage(url: url) { image in
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}

protocol ImageDownloaderProtocol {

}

final class ImageDownloader {

    private let session: URLSession
    private let imageCache = NSCache<NSString, NSData>()

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func loadImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        if let image = shouldLoadFromCache(url: url) {
            completion(image)
        } else {
            loadImageFrom(url: url, completion: completion)
        }
    }

    private func shouldLoadFromCache(url: URL?) -> UIImage? {
        guard
            let absoluteString = url?.absoluteString,
            let nsdata = imageCache.object(forKey: absoluteString as NSString)
        else { return nil }

        let data = Data(referencing: nsdata)

        return UIImage(data: data)
    }

    private func loadImageFrom(url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else { return completion(nil) }

        session.dataTask(with: url) { [weak self] data, _, _ in
            guard
                let data = data,
                let image = UIImage(data: data)
            else { return completion(nil) }

            self?.cacheImage(data, key: url)
            completion(image)
        }.resume()
    }

    private func cacheImage(_ imageData: Data, key: URL) {
        imageCache.setObject(imageData as NSData, forKey: key.absoluteString as NSString)
    }
}
