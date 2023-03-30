//
//  NetworkManager.swift
//  Appetizers
//
//  Created by andre.aragao on 29/03/23.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    // old
    //    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    //            if let _ = error {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decoderResponse = try decoder.decode(AppetizerResponse.self, from: data)
    //                completed(.success(decoderResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //        task.resume()
    //    }
    
    // iOS 15
    // async that throws errors(not always necessary)
    // throws make u use do try catch when you call this method (on viewModel)
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        // _ response can use to throw differente error by status code
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AppetizerResponse.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
