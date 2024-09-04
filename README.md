CryptoTracker for iOS:
- 

Overview:
- This app fetches data for the top cryptocurrencies and displays them in a list view.
- Tapping a list item will present a detail page which contains information about the cryptocurrency.
- Data for 20 crypto coins will be loaded at a time.
- Scrolling to the bottom of the list will automatically load and display data for 20 more coins
- Uses 0 third party libraries

API: 
- Uses the free version of the API below which has a rate limit of ~50 calls per minute
https://docs.coingecko.com/v3.0.1/reference/coins-markets

Skills used in this project:
- 

MVVM Architecture

Networking:
- async/await
- Generic Types
- Parsing JSON data 
- Custom Error Handling 
- URLComponents

Dependency Injection
- Initializer injection
- Protocol-oriented dependency injection for Service class
  
Caching
- Cache crypto coin data (including image data) to reduce network calls, reduce data usage, and improve memory and battery performance
  
Unit Testing
- Implemented a Mock Service and mock data for various test cases
- Utilized dependency injection and modularization to facilitate unit tests

SwiftUI
- List view
- Task modifiers
- Pagination
- Image caching

Concurrency / Threading
- async/await
- @MainActor
