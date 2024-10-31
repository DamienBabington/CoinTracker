//
//  Coin.swift
//  CryptoTracker
//
//  Created by Damien on 8/29/24.
//

import Foundation

struct Coin: Decodable, Identifiable, Hashable {
    let id: String
    let symbol: String
    let name: String
    let currentPrice: Double
    let marketCapRank: Int
    let image: String
    
    var priceString: String {
        let price = self.currentPrice
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        if let formattedPrice = numberFormatter.string(from: NSNumber(value: price)) {
            return formattedPrice
        } else {
            return ""
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
    }
}


