//
//  SwiftUIUpdateable.swift
//  SwiftSpellBook
//
//
//  Created by Steve Sheets on 2/12/21.
//  Copyright © 2021 Steve Sheets. All rights reserved.
//

import Foundation

/// Protocol for any UI element that can be updated
public protocol SwiftUIUpdateable {
    
    /// SIgnal that element need to be Updated.
    func updateUI()
    
}
