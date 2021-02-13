//
//  Array+SwiftSpellBook.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 2/10/21.
//  Created by Steve Sheets on 2/12/21.
//

import Foundation

// MARK: Extension Array

// Extension to Array whose elements are objects.
public extension Array where Element: AnyObject {
    
    /// If element is object, if array contains object (not equal valued object), then remove that instance from list.
    /// - Parameter item: AnyObject to remove
    mutating func remove(item: AnyObject) {
        for (index, element) in self.enumerated()  {
            if element===item {
                self.remove(at: index)
            }
        }
    }
}


