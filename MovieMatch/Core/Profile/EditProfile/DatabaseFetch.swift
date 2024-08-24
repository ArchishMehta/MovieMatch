//
//  DatabaseFetch.swift
//  MovieMatch
//
//  Created by Archish Mehta on 2024-08-23.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager() // Make the `shared` instance static for global access.
    
    private let apiKey = "7615507531c77bb6f9e643568d925843"
    private let baseURL = "https://api.themoviedb.org/3"
    
    private init() {} // Private initializer to ensure only one instance is created.
    
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
}
