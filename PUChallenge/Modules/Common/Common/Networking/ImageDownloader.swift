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
                                                              compatibleWith: UITraitCollection.current)) {
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

        session.dataTask(with: url) { [weak self] data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data)
            else { return completion(nil) }

            self?.cacheImage(image)
            completion(image)
        }.resume()
    }

    private func cacheImage(_ image: UIImage) {
        
    }


//    func loadUrl(url: URL) {
//        let key = url.absoluteString as NSString
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                print(error)
//                return
//            }
//            DispatchQueue.main.async {
//                if let imageData = data {
//                    self.imageCache.setObject(imageData as NSData, forKey: key)
//                    self.apply(data: imageData as NSData)
//                }
//            }
//        }.resume()
//    }
}

/*
class RemoteImage: ObservableObject {



    @Published var image: UIImage?

    convenience init(imageURL: String, placeholder: String = "ic_logo_nsbrazil") {
        self.init(imageURL: URL(string: imageURL), placeholder: placeholder)
    }

    init(imageURL: URL?, placeholder: String = "ic_logo_nsbrazil") {
        self.image = UIImage(named: placeholder)
        load(imageUrl: imageURL)
    }

    init(imageURL: URL) {
        load(imageUrl: imageURL)
    }

    func load(imageUrl: URL?) {
        guard let imageUrl = imageUrl else { return }
        let key = imageUrl.absoluteString as NSString
        // check cached image
        if let cachedData = imageCache.object(forKey: key) {
            apply(data: cachedData)
            return
        } else {
            // if not, download image from url
            loadUrl(url: imageUrl)
        }
    }

    private func apply(data: NSData) {
        if let image = UIImage(data: (data as Data)) {
            self.image = image
        }
    }



}*/
