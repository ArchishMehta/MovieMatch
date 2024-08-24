//
//  PopularMovieViewModel.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import Foundation
import SwiftUI

class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    
    func fetchMovies() {
        isLoading = true
        NetworkManager.shared.fetchPopularMovies(page: 1) { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies ?? []
                self?.isLoading = false
            }
        }
    }
}
