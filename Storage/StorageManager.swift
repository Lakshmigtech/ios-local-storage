import Foundation

final class StorageManager: StorageManagerProtocol {
    
    private let codableStorage: CodableStorageProtocol
    
    init(
        codableStorage: CodableStorageProtocol = CodableStorage()
    ) {
        self.codableStorage = codableStorage
    }
    
    func save<T: Encodable>(
        _ object: T,
        key: String
    ) throws {
        try codableStorage.save(
            object,
            fileName: key
        )
    }
    
    func read<T: Decodable>(
        _ type: T.Type,
        key: String
    ) throws -> T {
        try codableStorage.read(
            type,
            fileName: key
        )
    }
    
    func delete(key: String) throws {
        try codableStorage.delete(
            fileName: key
        )
    }
}
