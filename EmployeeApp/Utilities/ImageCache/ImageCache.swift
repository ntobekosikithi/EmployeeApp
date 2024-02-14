//
//  ImageCache.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import Foundation
import UIKit

class ImageCache {
    private var cache: [URL: UIImage] = [:]

    func cacheImage(_ image: UIImage, for url: URL) {
        cache[url] = image
    }

    func image(for url: URL) -> UIImage? {
        return cache[url]
    }
}
