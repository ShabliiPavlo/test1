//
//  CharModel.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import Foundation

struct Character: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let location: Location
}

struct Location: Codable, Hashable {
    let name: String
    let url: String
}

struct CharacterResponse: Codable {
    struct Info: Codable {
        let pages: Int
    }

    let info: Info
    let results: [Character]
}

struct LocationDetails: Identifiable, Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
