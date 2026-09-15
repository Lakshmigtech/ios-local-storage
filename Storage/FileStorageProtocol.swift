import Foundation

protocol FileStorageProtocol {
    
    func save(_ data: Data, fileName: String) throws
    
    func read(fileName: String) throws -> Data
    
    func delete(fileName: String) throws
    
    func exists(fileName: String) -> Bool
}
