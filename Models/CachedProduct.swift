import Foundation

struct CachedProduct: Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let cachedAt: Date
}
