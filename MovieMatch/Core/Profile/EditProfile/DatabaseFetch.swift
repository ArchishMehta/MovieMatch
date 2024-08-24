//
//  DatabaseFetch.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let apiKey = "7615507531c77bb6f9e643568d925843"
    private let baseURL = "https://api.themoviedb.org/3"
    
    private init() {}
    
    func fetchPopularMovies(page: Int, completion: @escaping ([Movie]?) -> Void) {
        let urlString = "\(baseURL)/movie/popular?api_key=\(apiKey)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MovieResponse.self, from: data)
                completion(result.results)
                
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchMovieDetails(id: Int, completion: @escaping (MovieDetails?) -> Void) {
        let urlString = "\(baseURL)/movie/\(id)?api_key=\(apiKey)&language=en-US"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieDetails = try decoder.decode(MovieDetails.self, from: data)
                completion(movieDetails)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
    
}
