import Foundation

protocol UserDefaultsStorageProtocol {
    
    func set<T>(_ value: T, forKey key: String)
    
    func value<T>(forKey key: String) -> T?
    
    func removeValue(forKey key: String)
    
    func containsValue(forKey key: String) -> Bool
}
