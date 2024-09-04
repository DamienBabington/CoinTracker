//
//  ImageLoader.swift
//  CryptoTracker
//
//  Created by Damien on 9/4/24.
//

import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    private let urlString: String
    
    init(url: String) {
        self.urlString = url
        /* can put the Task here instead of adding a task modifier to the view since it's a
            subview that will always be contained within another view
         */
        Task { await loadImage() }
    }
    
    /* not using HTTPDownloader service since it requires specification of a type, but this just fetches Data.
        Could add another method to the service that just returns Data, but this is okay for now
     */
    @MainActor
    private func loadImage() async {
        if let cached = ImageCache.shared.get(forKey: urlString) {
            print("Fetched image from cache")
            self.image = Image(uiImage: cached)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Fetched image from API")
            guard let image = UIImage(data: data) else { return }
            self.image = Image(uiImage: image)
            ImageCache.shared.set(image, forKey: urlString)
        } catch {
            print("Failed to fetch image: \(error)")
        }
    }
}
