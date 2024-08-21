//
//  User.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let movie: String
    var year: Int
    var profileImageURLs: [String]

}
