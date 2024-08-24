//
//  PopularMovieView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import SwiftUI

struct PopularMoviesView: View {
    @StateObject private var viewModel = PopularMoviesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    if let overview = movie.overview {
                        Text(overview)
                            .font(.subheadline)
                            .lineLimit(3)
                    }
                }
            }
            .navigationTitle("Popular Movies")
            .onAppear {
                viewModel.fetchMovies()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading movies...")
                }
            }
        }
    }
}
