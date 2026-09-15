import Foundation

protocol KeychainStorageProtocol {
    
    func save(_ value: String, forKey key: String) throws
    
    func read(forKey key: String) throws -> String
    
    func delete(forKey key: String) throws
}
