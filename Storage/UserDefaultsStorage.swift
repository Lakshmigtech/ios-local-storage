import Foundation

final class UserDefaultsStorage: UserDefaultsStorageProtocol {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func set<T>(_ value: T, forKey key: String) {
        userDefaults.set(value, forKey: key)
    }
    
    func value<T>(forKey key: String) -> T? {
        return userDefaults.object(forKey: key) as? T
    }
    
    func removeValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    func containsValue(forKey key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }
}
