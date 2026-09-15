import Foundation

struct UserPreferences: Codable, Equatable {
    let isDarkModeEnabled: Bool
    let selectedLanguage: String
    let notificationsEnabled: Bool
}
