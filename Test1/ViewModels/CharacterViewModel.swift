//
//  CharacterViewModel.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters = [Character]()
    @Published var selectedCharacter: Character?
    
    private var currentPage = 1
    private var totalPages = 1

    var hasPreviousPage: Bool {
        return currentPage > 1
    }

    var hasNextPage: Bool {
        return currentPage < totalPages
    }

    func loadCharacters() async {
        do {
            let result = try await NetworkManager.shared.fetchCharacters(page: currentPage)
            await MainActor.run {
                self.characters = result.results
                self.totalPages = result.info.pages
            }
        } catch {
            print("Error loading characters: \(error)")
        }
    }
    
    func loadNextPage() {
        if hasNextPage {
            currentPage += 1
            Task {
                await loadCharacters()
            }
        }
    }

    func loadPreviousPage() {
        if hasPreviousPage {
            currentPage -= 1
            Task {
                await loadCharacters()
            }
        }
    }
}
