//
//  CoinViewModel.swift
//  CryptoTracker
//
//  Created by Damien on 8/29/24.
//

import Foundation

class CoinsViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var errorMessage: String?
    
    private let service: CoinServiceProtocol
    
    init(service: CoinServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchCoins() async {
        do {
            let coins = try await service.fetchCoins()
            self.coins.append(contentsOf: coins)
        } catch {
            guard let error = error as? CoinAPIError else { return }
            self.errorMessage = error.customErrorMessage
        }
    }
}


// MARK: - Using Completion Handlers

//    init() {
//        self.fetchCoins()
//    }
//    func fetchCoins() {
//        DispatchQueue.main.async {
//            self.service.fetchCoinsWithResult { [weak self] result in
//                switch result {
//                case .success(let coins):
//                    self?.coins = coins
//                case .failure(let error):
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
//    }
