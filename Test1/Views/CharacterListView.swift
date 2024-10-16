//
//  ContentView.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            List(viewModel.characters, id: \.id) { character in
                CharInfoView(character: character) {
                    coordinator.push(.details(character))
                }
            }
            
            HStack {
                Button("Previous") {
                    viewModel.loadPreviousPage()
                }
                .disabled(!viewModel.hasPreviousPage)

                Spacer()

                Button("Next") {
                    viewModel.loadNextPage()
                }
                .disabled(!viewModel.hasNextPage)
            }
            .padding()
        }
        .task {
            await viewModel.loadCharacters()
        }
    }
}

#Preview {
    CharacterListView()
}

struct CharInfoView: View {
    var character: Character
    var action: () -> Void
    
    var body: some View {
        HStack {
            AsyncImageView(imageURL: character.image)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.headline)
                
                Text("Status: \(character.status)")
                    .font(.subheadline)
                
                Text("Species: \(character.species)")
                    .font(.subheadline)
            }
            Spacer()
            
            Button(action: {
                action()
            }) {
                Text("Location")
                    .foregroundColor(.blue)
            }
        }
    }
}




