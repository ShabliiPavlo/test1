//
//  Coordinator.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

enum Sheet: String, Identifiable {
    case details
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var selectedCharacter: Character?
    
    func presentDetails(character: Character) {
        selectedCharacter = character
        sheet = .details
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .details:
            if let character = selectedCharacter {
                CharacterDetailView(character: character)
            }
        }
    }
}
