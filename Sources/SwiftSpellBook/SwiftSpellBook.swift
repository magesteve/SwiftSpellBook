//
//  SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

// MARK: - Protocols

/// Protocol to support having actions.
///
/// Types that support SlamActionable manage a closure that attempts some action, with an utility function to invoke the closure. It is comon to use this protocol on Button-like views.
public protocol SlamActionable {

    // MARK: - Required Properties
    
    /// Optional Pressed button action closure.
    var slamActionClosure: SwiftSpellBook.SimpleClosure? { get set }
    
}

/// Protocol to support that can input text
///
/// Types that support SlamTextInputable are visible objects that support having a closure to invoke when the string value is changed.  It is comon to use this protocol on views like NSText or NSTextField.
public protocol SlamTextInputable {

    // MARK: - Required Properties

    // state of text
    var slamTextState: String { get set }

    /// Optional text change event
    var slamTextChangedEvent: SwiftSpellBook.StringClosure? { get set }

}

/// Protocol to support that can input integer value
///
/// Types that support SlamIntInputable are visible objects that support having a closure to invoke when the string value is changed.  It is comon to use this protocol on views like NSStepper.
public protocol SlamIntInputable {

    // MARK: - Required Properties

    // state of int
    var slamIntState: Int { get set }

    /// Optional int change event
    var slamIntChangedEvent: SwiftSpellBook.IntClosure? { get set }

}

/// Protocol to support that can input Bool value
///
/// Types that support SlamSwitchable are visible objects that support having a closure to invoke when the bool value is changed.  It is comon to use this protocol on views like NSSwitch & NSCheckBox.
public protocol SlamSwitchable {

    // MARK: Required Properties
    
    // state of flag
    var slamSwitchState: Bool { get set }

    /// Optional switch change event
    var slamSwitchChangedEvent: SwiftSpellBook.BoolClosure? { get set }

}


/// Protocol for any UI element that can be updated
public protocol SwiftUIUpdateableProtocol {
    
    /// SIgnal that element need to be Updated.
    func updateUI()
    
}


// MARK: - Structure

/// Abstract extension for name space of typealias & static functions.
public struct SwiftSpellBook {
    
}

// MARK: Closure Typealiases

public extension SwiftSpellBook {
    
    // MARK: Result Closures
    
    /// Closure that has no results and no parameters.
    typealias SimpleClosure = () -> Void

    // MARK: Informative Closures
    
    /// Closure that has no results, but it passed a URL.
    typealias URLClosure = (URL) -> Void
    
    /// Closure that has no results, but it passed a Data.
    typealias DataClosure = (Data) -> Void
    
    /// Closure that has no results, but it passed a Date.
    typealias DateClosure = (Date) -> Void
    
    /// Closure that has no results, but it passed a String.
    typealias StringClosure = (String) -> Void
    
    /// Closure that has no results, but it passed a Int.
    typealias IntClosure = (Int) -> Void
    
    /// Closure that has no results, but it passed a Bool.
    typealias BoolClosure = (Bool) -> Void
    
    // MARK: Result Closures
    
    /// Closure that has no parameters, but it returns a URL.
    typealias URLResultClosure = () -> URL
    
    /// Closure that has no parameters, but it returns a Data.
    typealias DataResultClosure = () -> Data
    
    /// Closure that has no parameters, but it returns a Date.
    typealias DateResultClosure = () -> Date
    
    /// Closure that has no parameters, but it returns a String.
    typealias StringResultClosure = () -> String
    
    /// Closure that has no parameters, but it returns a Int.
    typealias IntResultClosure = () -> Int
    
    /// Closure that has no parameters, but it returns a Bool.
    typealias BoolResultClosure = () -> Bool

    /// Closure type that is passed nothing, and returns an Array.
    typealias ArrayResultClosure = () -> [Any]

    /// Closure type that is passed an Int, and returns nothing.
    typealias IntInformStringResultClosure = (Int) -> String
}

// MARK: UserDefaults

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
