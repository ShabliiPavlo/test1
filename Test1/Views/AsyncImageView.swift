//
//  AsyncImageView.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var viewModel: AsyncImageViewModel
    
    init(imageURL: String) {
        _viewModel = StateObject(wrappedValue: AsyncImageViewModel(imageURL: imageURL))
    }
    
    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .task {
            await viewModel.loadImage()
        }
    }
}


