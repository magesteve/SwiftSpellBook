//
//  SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation
import Cocoa

/// Abstract extension for name space of typealias & static functions.
public struct SwiftSpellBook {
    
}

// MARK: Closure Typealiases

public extension SwiftSpellBook {
    
    /// Closure that has no results, but it passed a URL.
    typealias URLClosure = (URL) -> Void
    
    /// Closure that has no results, but it passed a Data.
    typealias DataClosure = (Data) -> Void
    
    /// Closure that has no results, but it passed a String.
    typealias StringClosure = (String) -> Void
    
    /// Closure that has no results, but it passed a Int.
    typealias IntClosure = (Int) -> Void
    
}

// MARK: String Extensions

public extension String {
    
    /// Reverse if isEmpty.  Function returns true if content contains something.
    func isNotEmpty() -> Bool { !isEmpty }
    
}

