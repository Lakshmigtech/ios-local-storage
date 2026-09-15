# iOS Local Storage 

A native iOS technical showcase demonstrating different local persistence and caching strategies using Swift.

The repository focuses on selecting the appropriate storage mechanism based on data type, security requirements, lifetime, and application needs.

## Technologies

* Swift
* UIKit
* UserDefaults
* Keychain
* FileManager
* Codable
* NSCache
* Core Data
* Protocol-Oriented Programming
* Repository Pattern
* Dependency Injection
* MVVM
* Error Handling
* XCTest

## Architecture

The showcase follows a layered approach:

```text
ViewController
      ↓
ViewModel
      ↓
Service / Repository
      ↓
Storage Protocol
      ↓
Storage Implementation
      ↓
Local Persistence
```

Protocols are used to separate application logic from storage implementations and to make components easier to test.

## Storage mechanisms demonstrated

### UserDefaults

Used for small, non-sensitive application preferences.

Examples:

* Dark mode preference
* Selected language
* Notification preference
* Feature flags
* Simple application settings

Sensitive information such as passwords and authentication tokens should not be stored in UserDefaults.

### Keychain

Used for sensitive information that requires secure storage.

Examples:

* Access tokens
* Refresh tokens
* Sensitive identifiers
* Credentials

The Keychain implementation uses Apple's Security framework.

### FileManager

Used for file-based local persistence.

Examples:

* JSON files
* Documents
* Downloaded files
* Images
* Offline data

The implementation uses the application's Documents directory.

### Codable

Codable is used to convert Swift models into JSON data and restore them from local storage.

This provides a reusable approach for persisting structured application models.

### In-memory cache

NSCache is used for temporary, frequently accessed data.

Advantages include:

* Fast access
* Reduced disk operations
* Reduced network requests
* Automatic memory-pressure handling by the system

### Core Data

Core Data is demonstrated for structured persistent application data.

The repository pattern keeps Core Data implementation details outside the ViewModel and UI layers.

## Key implementations

### Storage abstraction

Storage protocols allow implementations to be replaced without changing the application layer.

```text
StorageManagerProtocol
        ↓
StorageManager
        ↓
CodableStorage
        ↓
FileStorage
```

### Secure token storage

```text
Authentication
      ↓
UserSessionService
      ↓
KeychainStorageProtocol
      ↓
KeychainStorage
      ↓
Apple Keychain
```

### Preferences

```text
ViewModel
    ↓
UserPreferencesService
    ↓
UserDefaultsStorageProtocol
    ↓
UserDefaultsStorage
    ↓
UserDefaults
```

### Database

```text
ViewModel
    ↓
UserRepositoryProtocol
    ↓
UserRepository
    ↓
CoreDataStack
    ↓
Core Data
```

## Security considerations

The repository follows these storage rules:

* Never store passwords in UserDefaults.
* Never store access tokens in UserDefaults.
* Use Keychain for sensitive authentication information.
* Do not commit secrets to source control.
* Do not include production credentials.
* Do not include API keys.
* Do not include certificates or private keys.
* Avoid storing unnecessary personal information.
* Use dummy data for examples and tests.

## Error handling

Storage operations use typed errors instead of silently ignoring failures.

Examples include:

* Key not found
* Encoding failure
* Decoding failure
* Save failure
* Read failure
* Delete failure
* Invalid data
* Keychain errors

## Dependency Injection

Storage dependencies are injected into services.

Example:

```swift
init(
    storage: UserDefaultsStorageProtocol = UserDefaultsStorage()
)
```

This allows production implementations to be replaced with mock implementations during testing.

## Testing

The repository demonstrates unit testing for:

* UserDefaults storage
* Codable encoding and decoding
* Cache operations
* Storage services
* Error scenarios

Protocols and dependency injection make storage components independently testable.

## Design principles demonstrated

* Single Responsibility Principle
* Dependency Inversion Principle
* Protocol-Oriented Programming
* Separation of Concerns
* Repository Pattern
* Dependency Injection
* Reusable storage abstractions
* Centralized error handling
* Secure data handling

## What to store where

| Data                          | Recommended storage                                 |
| ----------------------------- | --------------------------------------------------- |
| App settings                  | UserDefaults                                        |
| Dark mode preference          | UserDefaults                                        |
| Selected language             | UserDefaults                                        |
| Access token                  | Keychain                                            |
| Refresh token                 | Keychain                                            |
| Password                      | Avoid storing; use secure authentication mechanisms |
| JSON document                 | FileManager + Codable                               |
| Downloaded document           | FileManager                                         |
| Temporary cached object       | NSCache                                             |
| Structured persistent records | Core Data                                           |

## Public Repository Safety

This repository is created as a technical showcase.

It does not contain:

* Company source code
* Client source code
* Production URLs
* Production credentials
* API keys
* Authentication tokens
* Certificates
* Private keys
* Customer information
* Personally identifiable information

All examples use dummy or placeholder data.

## Purpose

This repository demonstrates practical iOS local persistence, secure storage, caching, abstraction, dependency injection, error handling, and testing practices suitable for production-oriented mobile development.
