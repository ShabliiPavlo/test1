//
//  CharacterDetailView.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    var body: some View {
        VStack {
            CharacterInfoView(character: character)
            
            if let locationDetails = viewModel.locationDetails {
                LocationDetailsView(locationDetails: locationDetails)
            } else {
                ProgressView("Loading location details...")
            }
        }
        .padding()
        .task {
            await viewModel.loadLocation(from: character.location.url)
        }
    }
}

struct CharacterInfoView: View {
    var character: Character
    
    var body: some View {
        VStack {
    
            AsyncImageView(imageURL: character.image)
                .frame(width: 200, height: 200)
            
            Text(character.name)
                .font(.largeTitle)
                .padding()

            Text("Status: \(character.status)")
                .font(.title2)
            
            Text("Species: \(character.species)")
                .font(.title2)
        }
    }
}

struct LocationDetailsView: View {
    var locationDetails: LocationDetails
    
    var body: some View {
        VStack {
            Text("Location: \(locationDetails.name)")
                .font(.title2)
                .padding()

            Text("Type: \(locationDetails.type)")
                .font(.title2)
                .padding()

            Text("Dimension: \(locationDetails.dimension)")
                .font(.title3)
                .padding()

            Text("Residents: \(locationDetails.residents.count)")
                .font(.title3)
                .padding()
        }
    }
}
