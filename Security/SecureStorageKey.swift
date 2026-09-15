import Foundation

enum SecureStorageKey {
    
    static let accessToken = "access_token"
    static let refreshToken = "refresh_token"
}
try keychain.save(
    token,
    forKey: SecureStorageKey.accessToken
)
