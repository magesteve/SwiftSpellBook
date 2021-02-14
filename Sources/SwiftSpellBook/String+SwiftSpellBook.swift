//
//  String+SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 2/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

// MARK: - String Extensions

public extension String {
    
    // MARK: - Computed Property
    
    /// Reverse of isEmpty.  Variable returns true if content contains something.
    var isNotEmpty: Bool { !isEmpty }
    
    /// Splitting camel case string into human readable
    var splitCamelCase: String {
        guard self.isNotEmpty else { return "" }
        
        var result = ""
        var startFlag = true
        var numberFlag = false
        for letter in self {
            if letter=="_" {
                result = result + " "
                startFlag = true
            }
            else if letter.isNumber {
                if !numberFlag && !startFlag {
                    result = result + " "
                }
                result = result + String(letter)
                numberFlag = true
           }
           else if letter.isUppercase {
                if numberFlag || !startFlag {
                    result = result + " "
                }
                result = result + String(letter)
                startFlag = false
                numberFlag = false
            }
            else if letter.isLowercase {
                if numberFlag {
                    result = result + " " + letter.uppercased()
                }
                else if startFlag {
                    result = result + letter.uppercased()
                }
                else {
                    result = result + String(letter)
                }
                startFlag = false
                numberFlag = false
            }
            else {
                numberFlag = false
                result = result + String(letter)
            }
        }
        
        return result
    }
    
    // MARK: - Functions
    
    /// Make string with self and new line to existing text (with LF when needed)
    /// - Parameter newline: String text to add
    func make(newline: String) -> String {
        let nextLine = self.isEmpty ? "" : "\n"
        
        return self + nextLine + newline
    }
    
    /// Add new line to existing text (with LF when needed)
    /// - Parameter newline: String text to add
    mutating func add(newline: String) {
        let nextLine = self.isEmpty ? "" : "\n"
        
        self = self + nextLine + newline
    }

}

