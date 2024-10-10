//
//  NetworckManager.swift
//  Test1
//
//  Created by Pavel Shabliy on 10.10.2024.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacters(page: Int) async throws -> CharacterResponse {
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
        
        return characterResponse
    }
}
