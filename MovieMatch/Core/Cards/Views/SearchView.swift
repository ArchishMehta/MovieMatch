//
//  SearchView.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search movies...", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(viewModel.filteredMovies) { movie in
                    HStack(alignment: .top) {
                        if let posterURL = movie.posterURL {
                            AsyncImage(url: posterURL) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 150)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie.title)
                                .font(.headline)
                            if let overview = movie.overview {
                                Text(overview)
                                    .font(.subheadline)
                                    .lineLimit(3)
                            }
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Search Movies")
            .onAppear {
                viewModel.loadMovies()
            }
        }
    }
}
