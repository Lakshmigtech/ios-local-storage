import Foundation

protocol CodableStorageProtocol {
    
    func save<T: Encodable>(
        _ object: T,
        fileName: String
    ) throws
    
    func read<T: Decodable>(
        _ type: T.Type,
        fileName: String
    ) throws -> T
    
    func delete(fileName: String) throws
}
