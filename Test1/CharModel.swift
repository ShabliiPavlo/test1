//
//  CharModel.swift
//  Test1
//
//  Created by Pavel Shabliy on 09.10.2024.
//

import Foundation

struct Character: Identifiable, Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

struct CharacterResponse: Codable {
    struct Info: Codable {
        let pages: Int
    }

    let info: Info
    let results: [Character]
}
