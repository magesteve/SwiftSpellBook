//
//  Codable+SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 3/26/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

// MARK: - Extensions

public extension Decodable {
    
    /// Read JSON Data into this type of element
    /// - Parameter from: Data to read JSON from
    /// - Returns: Optiona Any, but actual type of class being extended.
    func spellReadJSONData(from: Data) -> Any? {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(type(of: self), from: from) {
            return result
        }
        
        return nil
    }
    
    /// Read JSON strings into this type of element
    /// - Parameter from: String contain JSON to read
    /// - Returns: Optiona Any, but actual type of class being extended.
    func spellReadJSONString(from: String) -> Any? {
        guard let data = from.data(using: .utf8) else { return nil }
        
        return spellReadJSONData(from: data)
    }

}

public extension Encodable {
    
    /// Write JSON Data from this element
    /// - Returns: Optional Data containing json encoded from Encodable class.
    func spellWriteJSONData() -> Data? {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self)  {
            return data
        }
        else {
            return nil
        }
    }

    /// Write JSON String from this element
    /// - Returns: Optional String containing json encoded from Encodable class.
    func spellWriteJSONString() -> String? {
        guard let data = spellWriteJSONData() else { return nil }
        
        return String(decoding: data, as: UTF8.self)
    }
    
    /// Export dictionary based on encodable
    /// - Returns: Dictionary containing content of self
    func spellWriteDictionary() -> SwiftSpellBook.StandardDictionary? {
        let encoder = JSONEncoder()

        guard let data = try? encoder.encode(self), let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? SwiftSpellBook.StandardDictionary else { return nil }

        
        return dictionary
    }

}
