//
//  Codable+SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 2/9/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

// MARK: - Extensions

public extension Decodable {
    
    /// Read JSON Data into this type of element
    func readJSONData(from: Data) -> Any? {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(type(of: self), from: from) {
            return result
        }
        
        return nil
    }
    
    /// Read JSON strings into this type of element
    func readJSONString(from: String) -> Any? {
        guard let data = from.data(using: .utf8) else { return nil }
        
        return readJSONData(from: data)
    }

}

public extension Encodable {
    
    /// Write JSON Data from this element
    func writeJSONData() -> Data? {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self)  {
            return data
        }
        else {
            return nil
        }
    }

    /// Write JSON String from this element
    func writeJSONString() -> String? {
        guard let data = writeJSONData() else { return nil }
        
        return String(decoding: data, as: UTF8.self)
    }
    
    /// Export dictionary based on encodable
    /// - Returns: Dictionary containing content of self
    func writeDictionary() throws -> SwiftSpellBook.StandardDictionary? {
        let data = try JSONEncoder().encode(self)
        
        if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? SwiftSpellBook.StandardDictionary {
            return dictionary
        }
        else {
            return nil
        }
    }

}
