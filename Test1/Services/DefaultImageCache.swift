//
//  DefaultImageCache.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

protocol ImageCache {
    func setImage(_ image: UIImage?, key: String)
    func getImage(forKey key: String) -> UIImage?
}

final class DefaultImageCache: ImageCache {
    private var unsafeDict: [String: UIImage] = [:]

    func setImage(_ image: UIImage?, key: String) {
        self.unsafeDict[key] = image
    }

    func getImage(forKey key: String) -> UIImage? {
        self.unsafeDict[key]
    }
}

