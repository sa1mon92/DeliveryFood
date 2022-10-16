//
//  NetworkManager.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 15.10.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getData<T: Decodable>(type: T.Type, from url: URL, completion: @escaping (Result<T?, Error>) -> Void)
    func getData(from url: URL, completion: @escaping (Result<Data?, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    func getData(from url: URL, completion: @escaping (Result<Data?, Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completion(.failure(error)) }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
    
    func getData<T: Decodable>(type: T.Type, from url: URL, completion: @escaping (Result<T?, Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { completion(.failure(error)) }
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(json))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
