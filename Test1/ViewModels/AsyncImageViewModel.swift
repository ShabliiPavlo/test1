//
//  AsyncImageViewModel.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

class AsyncImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    private let imageLoader = ImageDownloader()
    private let imageURL: String
    
    init(imageURL: String) {
        self.imageURL = imageURL
    }
    
    func loadImage() async {
        do {
            self.image = try await imageLoader.downloadImage(imageURLString: imageURL)
        } catch {
            print("Failed to load image: \(error)")
        }
    }
}