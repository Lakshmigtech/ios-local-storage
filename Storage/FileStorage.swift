import Foundation

final class FileStorage: FileStorageProtocol {
    
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    private var documentsDirectory: URL {
        fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
    }
    
    private func fileURL(for fileName: String) -> URL {
        documentsDirectory.appendingPathComponent(fileName)
    }
    
    func save(_ data: Data, fileName: String) throws {
        
        let url = fileURL(for: fileName)
        
        do {
            try data.write(
                to: url,
                options: .atomic
            )
        } catch {
            throw StorageError.saveFailed
        }
    }
    
    func read(fileName: String) throws -> Data {
        
        let url = fileURL(for: fileName)
        
        do {
            return try Data(contentsOf: url)
        } catch {
            throw StorageError.readFailed
        }
    }
    
    func delete(fileName: String) throws {
        
        let url = fileURL(for: fileName)
        
        do {
            if fileManager.fileExists(atPath: url.path) {
                try fileManager.removeItem(at: url)
            }
        } catch {
            throw StorageError.deleteFailed
        }
    }
    
    func exists(fileName: String) -> Bool {
        let url = fileURL(for: fileName)
        
        return fileManager.fileExists(
            atPath: url.path
        )
    }
}
