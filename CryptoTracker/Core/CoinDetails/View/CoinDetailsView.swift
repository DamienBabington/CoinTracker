//
//  CoinDetailsView.swift
//  CryptoTracker
//
//  Created by Damien on 9/1/24.
//

import SwiftUI

struct CoinDetailsView: View {
    
    let coin: Coin
    @ObservedObject var viewModel: CoinDetailsViewModel
    
    init(coin: Coin, service: CoinServiceProtocol) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id, service: service)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
                ScrollView {
                    HStack {
                        Spacer()
                        Text("$60,157")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(details.name)
                                .fontWeight(.semibold)
                                .font(.subheadline)
                            
                            Text(details.symbol.uppercased())
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        ImageView(url: coin.image)
                            .frame(width: 64, height: 64)
                            .padding(.trailing)
                    }
                    
                    Text(details.description.text)
                        .font(.footnote)
                        .padding(.vertical)
                }
            }
        }
        .task {
            await viewModel.fetchCoinDetails()
        }
        .padding()
    }
}

#Preview {
    CoinDetailsView(coin: Coin(id: NSUUID().uuidString, symbol: "BTC", name: "bitcoin", currentPrice: 60000, marketCapRank: 1, image: ""), service: MockCoinService())
}
