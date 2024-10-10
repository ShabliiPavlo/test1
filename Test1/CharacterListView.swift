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
                Button(action: {
                    coordinator.presentDetails(character: character)
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
        .task {
            await viewModel.loadCharacters()
        }
        .sheet(item: $coordinator.sheet) { sheet in
            coordinator.build(sheet: sheet)
        }
    }
}

#Preview {
    CharacterListView()
}




