import Foundation

enum StorageError: LocalizedError {
    
    case keyNotFound
    case encodingFailed
    case decodingFailed
    case saveFailed
    case readFailed
    case deleteFailed
    case invalidData
    case keychainError(OSStatus)
    
    var errorDescription: String? {
        switch self {
        case .keyNotFound:
            return "The requested storage key was not found."
            
        case .encodingFailed:
            return "Unable to encode the object."
            
        case .decodingFailed:
            return "Unable to decode the stored object."
            
        case .saveFailed:
            return "Unable to save the data."
            
        case .readFailed:
            return "Unable to read the stored data."
            
        case .deleteFailed:
            return "Unable to delete the stored data."
            
        case .invalidData:
            return "The stored data is invalid."
            
        case .keychainError(let status):
            return "Keychain operation failed with status: \(status)."
        }
    }
}
