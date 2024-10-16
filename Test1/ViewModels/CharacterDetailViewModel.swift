//
//  CharacterDetailViewModel.swift
//  Test1
//
//  Created by Pavel Shabliy on 14.10.2024.
//

import Foundation

class CharacterDetailViewModel: ObservableObject {
    @Published var locationDetails: LocationDetails?

    func loadLocation(from url: String) async {
        do {
            let location = try await NetworkManager.shared.fetchLocation(from: url)
            await MainActor.run {
                self.locationDetails = location
            }
        } catch {
            print("Failed to load location details: \(error)")
        }
    }
}
