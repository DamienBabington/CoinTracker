//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Damien on 8/29/24.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    var body: some Scene {
        WindowGroup {
            CoinListView(service: CoinDataService())
        }
    }
}
