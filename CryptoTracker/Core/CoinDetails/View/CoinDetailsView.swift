//
//  CoinDetailsView.swift
//  CryptoTracker
//
//  Created by Damien on 9/1/24.
//

import SwiftUI

struct CoinDetailsView: View {
    
    // dependency injection (this view is dependent on this coin object in order to load the view)
    let coin: Coin
    @ObservedObject var viewModel: CoinDetailsViewModel
    
    init(coin: Coin, service: CoinServiceProtocol) {
        self.coin = coin
        self.viewModel = CoinDetailsViewModel(coinId: coin.id, service: service)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let details = viewModel.coinDetails {
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
        .task {
            await viewModel.fetchCoinDetails()
        }
        .padding()
    }
}

//#Preview {
//    CoinDetailsView()
//}
