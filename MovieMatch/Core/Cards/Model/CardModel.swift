//
//  CardModel.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import Foundation
struct CardModel {
    let user: User
    
}

extension CardModel: Identifiable, Hashable{
    var id: String { return user.id }
}
