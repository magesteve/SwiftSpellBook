//
//  SwiftDataable.swift
//  SwiftSpellBook
//
//  Created by Steve Sheets on 2/9/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.

import Foundation

/// Protocol that support converting item from/to Data object
public protocol SwiftDataable: Codable {
    
    /// Required function for SwiftDataable protocol to write serialized into Data
    func writeData() -> Data?

    /// Required function for SwiftDataable protocol to read serialized from passed Data into result
    func readData(from: Data) -> Any?
}
