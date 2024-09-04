//
//  CryptoTrackerTests.swift
//  CryptoTrackerTests
//
//  Created by Damien on 9/4/24.
//

import XCTest
@testable import CryptoTracker

final class CryptoTrackerTests: XCTestCase {

    func test_DecodeCoinsIntoArray_marketCapDesc() throws {
        do {
            let coins = try JSONDecoder().decode([Coin].self, from: mockCoinData_marketCapDesc)
            XCTAssertEqual(coins.count, 20)  // ensures all coins were decoded
            XCTAssertEqual(coins, coins.sorted(by: { $0.marketCapRank < $1.marketCapRank }))  // ensures sorting order
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
