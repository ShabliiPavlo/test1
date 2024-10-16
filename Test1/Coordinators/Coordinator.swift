//
//  Coordinator.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

enum Page: Identifiable, Hashable {
    
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
    
    func push(_ page:Page) {
        path.append(page)
    }

    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .details(let char):
            CharacterDetailView(character: char)
        }
    }
}
