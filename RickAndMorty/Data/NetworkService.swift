//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Aidar Asanakunov on 1/9/22.
//

import Foundation
import UIKit

class NetworkService {
    static func baseRequest<T: Codable>(url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        if url == nil {
            completion(.failure(NetworkError.wrongURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.dataNil))
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedObject = try decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
            
            
        }.resume()
    }
}
enum NetworkError: Error {
    case wrongURL
    case dataNil
}
