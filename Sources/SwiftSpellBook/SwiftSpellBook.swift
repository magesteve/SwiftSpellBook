//
//  SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 1/10/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

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
    
    /// Closure that has no parameters, but it returns a String.
    typealias StringResultClosure = () -> String
    
    /// Closure that has no parameters, but it returns a Int.
    typealias IntResultClosure = () -> Int
    
    /// Closure that has no parameters, but it returns a Bool.
    typealias BoolResultClosure = () -> Bool

}

