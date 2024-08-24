//
//  MockData.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-16.
//
import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: UUID().uuidString,
            movie: "Soul",
            year: 2020,
            profileImageURLs: ["soul", "soul2"]
        ),
        .init(
            id: UUID().uuidString,
            movie: "Toy Story",
            year: 1995,
            profileImageURLs: ["toystory", "toystory2"]
        ),
        .init(
            id: UUID().uuidString,
            movie: "Moana",
            year: 2016,
            profileImageURLs: ["moana", "moana2"]
        ),
        .init(
            id: UUID().uuidString,
            movie: "(500) Days of Summer",
            year: 2009,
            profileImageURLs: ["summer", "summer2"]
        )
    ]
}
