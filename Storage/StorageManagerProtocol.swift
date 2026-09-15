import Foundation

protocol StorageManagerProtocol {
    
    func save<T: Encodable>(
        _ object: T,
        key: String
    ) throws
    
    func read<T: Decodable>(
        _ type: T.Type,
        key: String
    ) throws -> T
    
    func delete(key: String) throws
}
