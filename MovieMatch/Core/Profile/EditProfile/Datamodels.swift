//
//  Datamodels.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String?
}
