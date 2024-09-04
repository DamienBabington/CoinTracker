//
//  HTTPDataDownloader.swift
//  CryptoTracker
//
//  Created by Damien on 9/1/24.
//

import Foundation

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(type: T.Type, endpoint: String) async throws -> T
}

// Generic fetch function
extension HTTPDataDownloader {
    func fetchData<T: Decodable>(type: T.Type, endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw CoinAPIError.requestFailed(description: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw CoinAPIError.requestFailed(description: "Request failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw CoinAPIError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("Error: \(error)")
            throw error as? CoinAPIError ?? .unknownError(error: error)
        }
    }
}
