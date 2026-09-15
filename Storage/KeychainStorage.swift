import Foundation
import Security

final class KeychainStorage: KeychainStorageProtocol {
    
    func save(_ value: String, forKey key: String) throws {
        
        guard let data = value.data(using: .utf8) else {
            throw StorageError.invalidData
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )
        
        guard status == errSecSuccess else {
            throw StorageError.keychainError(status)
        }
    }
    
    func read(forKey key: String) throws -> String {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result
        )
        
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                throw StorageError.keyNotFound
            }
            
            throw StorageError.keychainError(status)
        }
        
        guard
            let data = result as? Data,
            let value = String(data: data, encoding: .utf8)
        else {
            throw StorageError.invalidData
        }
        
        return value
    }
    
    func delete(forKey key: String) throws {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(
            query as CFDictionary
        )
        
        guard status == errSecSuccess ||
              status == errSecItemNotFound else {
            throw StorageError.keychainError(status)
        }
    }
}
