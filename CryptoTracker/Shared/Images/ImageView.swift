//
//  ImageView.swift
//  CryptoTracker
//
//  Created by Damien on 9/4/24.
//

import SwiftUI

// Could also use a service like Kingfisher to handle this
struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}

#Preview {
    ImageView(url: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")
}
