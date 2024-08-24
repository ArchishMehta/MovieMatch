import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var filteredMovies: [Movie] = []
    private var allMovies: [Movie] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filterMovies(query: query)
            }
            .store(in: &cancellables)
    }
    
    func loadMovies() {
        NetworkManager.shared.fetchPopularMovies(page: 1) { [weak self] movies in
            DispatchQueue.main.async {
                self?.allMovies = movies ?? []
                self?.filteredMovies = movies ?? []
                
                // Fetch additional details for each movie
                self?.fetchAdditionalMovieDetails()
            }
        }
    }
    
    private func fetchAdditionalMovieDetails() {
        let group = DispatchGroup()
        
        for movie in allMovies {
            group.enter()
            NetworkManager.shared.fetchMovieDetails(id: movie.id) { [weak self] details in
                DispatchQueue.main.async {
                    if let details = details {
                        if let index = self?.allMovies.firstIndex(where: { $0.id == movie.id }) {
                            self?.allMovies[index].runtime = details.runtime
                            self?.allMovies[index].genre_ids = details.genres?.map { $0.id }
                        }
                    }
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.filteredMovies = self.allMovies
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
