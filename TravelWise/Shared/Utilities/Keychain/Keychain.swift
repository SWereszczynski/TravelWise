//
//  Keychain.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

enum KeychainKeys: String {
    case authToken = "authenticationToken"
}
enum KeychainStatus: Int32, Error {
    case success = 0
    case unknownError
}

protocol KeychainProtocol {
    
    @discardableResult
    func save(key: KeychainKeys, data: Data) -> KeychainStatus
    func get(key: KeychainKeys) -> Data?
    func remove(for key: KeychainKeys) -> KeychainStatus
    func clear()
    var rx: Reactive<Keychain> { get }
}

struct Keychain: KeychainProtocol {    
    
    static let `default`: KeychainProtocol = Keychain()
    
    @discardableResult
    func save(key: KeychainKeys, data: Data) -> KeychainStatus {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String: data
            ] as [String: Any]
        SecItemDelete(query as CFDictionary)
        let value = SecItemAdd(query as CFDictionary, nil)
        return KeychainStatus(rawValue: value) ?? .unknownError
    }
    
    func get(key: KeychainKeys) -> Data? {
        let query = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: kCFBooleanTrue as Any,
            kSecMatchLimit as String: kSecMatchLimitOne
            ] as [String: Any]
        
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        guard status == noErr else { return nil }
        return dataTypeRef as! Data?
    }
    
    func remove(for key: KeychainKeys) -> KeychainStatus {
        let query = [
            kSecClass as String: kSecClassGenericPassword as String,
            kSecAttrAccount as String: key.rawValue
            ] as [String: Any]
        let status = SecItemDelete(query as CFDictionary)
        if status == 0 {
            return KeychainStatus.success
        } else {
            return KeychainStatus.unknownError
        }
    }
    
    func clear() {
        let secItemClasses = [kSecClassGenericPassword,
                              kSecClassInternetPassword,
                              kSecClassCertificate,
                              kSecClassKey,
                              kSecClassIdentity
        ]
        secItemClasses.forEach {
            let dictionary = [kSecClass as String: $0]
            SecItemDelete(dictionary as CFDictionary)
        }
    }
}
