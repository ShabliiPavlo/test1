//
//  CharacterDetailView.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        VStack {
            
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
            }
            .padding()

            Text(character.name)
                .font(.largeTitle)
                .padding()

            Text("Status: \(character.status)")
                .font(.title2)

            Text("Species: \(character.species)")
                .font(.title2)

        }
        .padding()
    }
}

