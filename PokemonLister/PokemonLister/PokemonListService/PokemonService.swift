//
//  PokemonService.swift
//  PokemonLister
//
//  Created by andre.aragao on 26/01/23.
//

import Foundation

protocol PokemonServicing {
    // Result é um enum contendo success(Success) e failure(Failure), dentro de success pode ter uma variável de qualquer tipo e no failure tem que herdar o protocolo Error
    func fetchPokemonList(completion: @escaping (Result<Pokedex, PokedexError>) -> Void)
}

final class PokemonService: PokemonServicing {
    private let urlPokedex = "https://pokeapi.co/api/v2/pokedex/2/"
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchPokemonList(completion: @escaping (Result<Pokedex, PokedexError>) -> Void) {
        guard let url = URL(string: urlPokedex) else {
            // tratar erro
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.requestError(error)))
            }
            
            // ~= dentro do range
            guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                // tratar erro
                return completion(.failure(PokedexError.httpError))
            }

            guard let data = data else {
                // tratar erro
                return completion(.failure(PokedexError.dataError))
            }
            
            do {
                let result = try JSONDecoder().decode(Pokedex.self, from: data)
                return completion(.success(result))
            } catch  {
                // tratar erro de decode
                // catch fornece esse "error"
                return completion(.failure(.decodeError(message: error.localizedDescription)))
            }
        }
        
        task.resume()
    }
}

enum PokedexError: Error {
    case requestError(Error)
    case httpError
    case dataError
    case decodeError(message: String)
}
