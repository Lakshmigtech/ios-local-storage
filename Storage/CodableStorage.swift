import Foundation

final class CodableStorage: CodableStorageProtocol {
    
    private let fileStorage: FileStorageProtocol
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init(
        fileStorage: FileStorageProtocol = FileStorage(),
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.fileStorage = fileStorage
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func save<T: Encodable>(
        _ object: T,
        fileName: String
    ) throws {
        
        do {
            let data = try encoder.encode(object)
            try fileStorage.save(
                data,
                fileName: fileName
            )
        } catch let error as StorageError {
            throw error
        } catch {
            throw StorageError.encodingFailed
        }
    }
    
    func read<T: Decodable>(
        _ type: T.Type,
        fileName: String
    ) throws -> T {
        
        do {
            let data = try fileStorage.read(
                fileName: fileName
            )
            
            return try decoder.decode(
                type,
                from: data
            )
        } catch let error as StorageError {
            throw error
        } catch {
            throw StorageError.decodingFailed
        }
    }
    
    func delete(fileName: String) throws {
        try fileStorage.delete(
            fileName: fileName
        )
    }
}
