//
//  SearchViewModel.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var filteredMovies: [Movie] = []
    private var allMovies: [Movie] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Listen for changes to the search query and update the filteredMovies array
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filterMovies(query: query)
            }
            .store(in: &cancellables)
    }
    
    func loadMovies() {
        // Load all movies (You can use the NetworkManager to fetch movies from the API)
        NetworkManager.shared.fetchPopularMovies(page: 1) { [weak self] movies in
            DispatchQueue.main.async {
                self?.allMovies = movies ?? []
                self?.filteredMovies = movies ?? []
            }
        }
    }
    
    private func filterMovies(query: String) {
        if query.isEmpty {
            filteredMovies = allMovies
        } else {
            filteredMovies = allMovies.filter { $0.title.lowercased().contains(query.lowercased()) }
        }
    }
}
