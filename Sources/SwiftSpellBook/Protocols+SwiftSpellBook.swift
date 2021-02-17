//
//  Protocols+SwiftSpellBook.swift
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

    // MARK: - Required Properties
    
    // state of flag
    var slamSwitchState: Bool { get set }

    /// Optional switch change event
    var slamSwitchChangedEvent: SwiftSpellBook.BoolClosure? { get set }

}


/// Protocol for any UI element that can be updated
public protocol SwiftUIUpdateableProtocol {
    
    // MARK: - Required Properties
    
    /// SIgnal that element need to be Updated.
    func updateUI()
    
}

// MARK: - Extensions

// Extension to SlamActionable
public extension SlamActionable {
    
    // MARK: - Public Functions
    
    /// Invoke Closure Action
    func slamPerformAction() {
        if let block = slamActionClosure {
            block()
        }
    }

}

// Extension to SlamTextInputable
public extension SlamTextInputable {
    
    // MARK: - Public Functions

   /// Invoke text changed
    func slamTextChangedAction() {
        if let block = slamTextChangedEvent {
            block(slamTextState)
        }
    }

}

// Extension to SlamIntInputable
public extension SlamIntInputable {
    
    // MARK: - Public Functions

   /// Invoke Int changed
    func slamIntChangedAction() {
        if let block = slamIntChangedEvent {
            block(slamIntState)
        }
    }

}

// Extension to SlamSwitchable
public extension SlamSwitchable {
    
    // MARK: - Public Functions

   /// Invoke switch changed
    func slamSwitchChangedAction() {
        if let block = slamSwitchChangedEvent {
            block(slamSwitchState)
        }
    }

}

