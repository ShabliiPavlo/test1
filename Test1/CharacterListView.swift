//
//  ContentView.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel = CharacterViewModel()
        
        var body: some View {
            VStack {
                List(viewModel.characters, id: \.id) { character in
                    Button(action: {
                        viewModel.selectedCharacter = character
                    }) {
                        Text(character.name)
                            .font(.headline)
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
            .sheet(item: $viewModel.selectedCharacter) { character in
                CharacterDetailView(character: character)
            }
            .task {
                await viewModel.loadCharacters()
            }
        }
    }
#Preview {
    CharacterListView()
}




