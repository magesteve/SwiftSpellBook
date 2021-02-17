//
//  SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

// MARK: - Structure

/// Abstract extension for name space of typealias & static functions.
public struct SwiftSpellBook {
    
}

// MARK: - Typealiases

public extension SwiftSpellBook {
    
    /// MARK: Standard Typealiases
    
    typealias StandardDictionary = [String: Any]
    
    // MARK: - Result Closures
    
    /// Closure that has no results and no parameters.
    typealias SimpleClosure = () -> Void

    // MARK: - Informative Closures
    
    /// Closure that has no results, but it passed a URL.
    typealias URLClosure = (URL) -> Void
    
    /// Closure that has no results, but it passed a Data.
    typealias DataClosure = (Data) -> Void
    
    /// Closure that has no results, but it passed a Date.
    typealias DateClosure = (Date) -> Void
    
    /// Closure that has no results, but it passed a String.
    typealias StringClosure = (String) -> Void
    
    /// Closure that has no results, but it passed an Array Strings.
    typealias StringArrayClosure = ([String]) -> Void
    
    /// Closure that has no results, but it passed a Int.
    typealias IntClosure = (Int) -> Void
    
    /// Closure that has no results, but it passed a Bool.
    typealias BoolClosure = (Bool) -> Void
    
    // MARK: - Result Closures
    
    /// Closure that has no parameters, but it returns a URL.
    typealias URLResultClosure = () -> URL
    
    /// Closure that has no parameters, but it returns a Data.
    typealias DataResultClosure = () -> Data
    
    /// Closure that has no parameters, but it returns a Date.
    typealias DateResultClosure = () -> Date
    
    /// Closure that has no parameters, but it returns a String.
    typealias StringResultClosure = () -> String
    
    /// Closure that has no parameters, but it returns an Array Strings.
    typealias StringArrayResultClosure = () -> [String]
    
    /// Closure that has no parameters, but it returns a Int.
    typealias IntResultClosure = () -> Int
    
    /// Closure that has no parameters, but it returns a Bool.
    typealias BoolResultClosure = () -> Bool

    /// Closure type that is passed nothing, and returns an Array.
    typealias ArrayResultClosure = () -> [Any]

    // MARK: - Specialty Closures
    
    /// Closure type that is passed an Int, and returns nothing.
    typealias IntInformStringResultClosure = (Int) -> String
}

// MARK: - UserDefaults

// Extension for User Defaults
public extension SwiftSpellBook {
    
    /// Retrieve the User Default string value for given key. If it does not exists, save the default value, and return it.
    /// - Parameters:
    ///   - key: String key for value
    ///   - defaultString: String
    /// - Returns: String Retrieved Value
    static func getUserDefault(key: String, defaultString: String) -> String {
        let ud = UserDefaults.standard
        if let value = ud.string(forKey: key) {
            return value
        }
        else {
            ud.set(defaultString, forKey: key)
            
            return defaultString
       }
    }
    
    /// Retrieve the User Default Int value for given key. If it does not exists, save the default value, and return it.
    /// - Parameters:
    ///   - key: String key for value
    ///   - defaultInt: Int
    /// - Returns: Int Retrieved Value
    static func getUserDefault(key: String, defaultInt: Int) -> Int {
        let ud = UserDefaults.standard
        if let _ = ud.object(forKey: key) {
            return ud.integer(forKey: key)
        }
        else {
            ud.set(defaultInt, forKey: key)
            
            return defaultInt
       }
    }
    
    /// Retrieve the User Default Bool value for given key. If it does not exists, save the default value, and return it.
    /// - Parameters:
    ///   - key: String key for value
    ///   - defaultBool: Bool
    /// - Returns: Bool Retrieved Value
    static func getUserDefault(key: String, defaultBool: Bool) -> Bool {
        let ud = UserDefaults.standard
        if let _ = ud.object(forKey: key) {
            return ud.bool(forKey: key)
        }
        else {
            ud.set(defaultBool, forKey: key)
            
            return defaultBool
       }
    }
    
    /// Set the String Value to the Key
    /// - Parameters:
    ///   - key: String key for value
    ///   - value: String value to save
    static func setUserDefault(key: String, _ value: String) {
        let ud = UserDefaults.standard
        let s = value as NSString
        ud.set(s, forKey: key)
    }
    
    /// Set the Int Value to the Key
    /// - Parameters:
    ///   - key: String key for value
    ///   - value: Int value to save
    static func setUserDefault(key: String, _ value: Int) {
        let ud = UserDefaults.standard
        ud.set(value, forKey: key)
    }
    
    /// Set the Bool Value to the Key
    /// - Parameters:
    ///   - key: String key for value
    ///   - value: Bool value to save
    static func setUserDefault(key: String, _ value: Bool) {
        let ud = UserDefaults.standard
        ud.set(value, forKey: key)
    }
    
    /// Remove list of keys from User Defaults
    /// - Parameter keys: Array of String to remove
    static func removeListUserDefault(keys: [String]) {
        let ud = UserDefaults.standard
        for s in keys {
            ud.removeObject(forKey: s)
        }
    }
}

