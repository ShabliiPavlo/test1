//
//   CoordinatorView.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
           NavigationStack(path: $coordinator.path) {
               CharacterListView()
                   .navigationDestination(for: Page.self) { character in
                       coordinator.build(page: character)
                   }
           }
           .environmentObject(coordinator)
       }
}

#Preview {
    CoordinatorView()
}
