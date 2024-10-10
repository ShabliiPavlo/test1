//
//  ImageDownloader.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

fileprivate enum ImageDownloaderError: Error {
    case invalidImageURL
    case dataError
}

final class ImageDownloader {
    
    private let session = URLSession.shared
    private let cache: ImageCache = DefaultImageCache()
    
    func downloadImage(imageURLString: String) async throws -> UIImage? {
        if let cachedImage = cache.getImage(forKey: imageURLString) {
            return cachedImage
        }
        
        guard let url = URL(string: imageURLString) else {
            throw ImageDownloaderError.invalidImageURL
        }
        
        let (data, _) = try await session.data(from: url)
        
        guard let image = UIImage(data: data) else {
            throw ImageDownloaderError.dataError
        }
    
        cache.setImage(image, key: imageURLString)
        
        return image
    }
}

