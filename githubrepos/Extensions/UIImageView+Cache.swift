//
//  UIImageView+Cache.swift
//  githubrepos
//
//  Created by Monsef Chakir on 30/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import Foundation
import UIKit


//source: https://gist.github.com/amosavian/a05044e57c290b5e064f4f7acfc3b506
extension UIImageView {
    /// Loads image from web asynchronosly and caches it, in case you have to load url
    /// again, it will be loaded from cache if available
    func load(url: URL, placeholder: UIImage?) {
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        self.image = image
                    }
                }
            }).resume()
        }
    }
}
