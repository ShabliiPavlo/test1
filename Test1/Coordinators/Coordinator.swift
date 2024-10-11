//
//  Coordinator.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

enum Sheet: Identifiable {
    
    case details(Character)
    
    var id: String {
        switch self {
        case .details(_):
            return "deteils"
        }
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    @Published var selectedCharacter: Character?
    
    
    func showSheet(type: Sheet) {
        sheet = type

    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .details(let char):
            CharacterDetailView(character: char)
        }
    }
}
