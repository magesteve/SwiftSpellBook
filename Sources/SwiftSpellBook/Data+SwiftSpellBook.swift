//
//  File.swift
//  
//
//  Created by Steve Sheets on 3/23/21.
//

import Foundation

// MARK: - Extension Array

// Extension to Data.
public extension Data {
    
    /// Output data as a Hex string (each charaacter 2 hexadecimal numbers)..
    func spellHexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
}
