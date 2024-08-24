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
struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String?
    var vote_average: Double?
    var genre_ids: [Int]?
    var runtime: Int?

    var posterURL: URL? {
        guard let posterPath = poster_path else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    var genreNames: [String] {
        genre_ids?.compactMap { genreMapping[$0] } ?? []
    }
}
struct MovieDetails: Codable {
    let runtime: Int?
    let genres: [Genre]?
    
    struct Genre: Codable {
        let id: Int
        let name: String
    }
}
