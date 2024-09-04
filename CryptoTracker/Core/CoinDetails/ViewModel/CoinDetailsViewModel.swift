//
//  CoinDetailsViewModel.swift
//  CryptoTracker
//
//  Created by Damien on 9/1/24.
//

import Foundation

class CoinDetailsViewModel: ObservableObject {
    
    private let service: CoinServiceProtocol
    private let coinId: String
    
    @Published var coinDetails: CoinDetails?
    
    // example of dependency injection - this VM depends on this coinId and service instead of creating new instances of them
    init(coinId: String, service: CoinServiceProtocol) {
        self.service = service
        self.coinId = coinId
    }
    
    @MainActor
    func fetchCoinDetails() async {
        do {
            self.coinDetails = try await service.fetchCoinDetails(id: coinId)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

