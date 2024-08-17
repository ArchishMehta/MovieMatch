//
//  CardService.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import Foundation

struct CardService {
    
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({CardModel(user: $0)})
    }
}
