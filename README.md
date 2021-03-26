# SwiftSpellBook

[![Swift](https://img.shields.io/badge/Swift-5-blue.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-12-blue.svg)](https://developer.apple.com/xcode)
[![SPM](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager)
[![MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Swift Package of useful tools for Swift Development on any platform.

## Installation

### Requirements

- Swift 5
- Xcode 11

### Repository

  https://github.com/magesteve/SwiftSpellBook

Refer to code documentation for explanation for specific calls.

## Closure Typealiases Magic

Typealiases for Closures. 

For example, DataClosure is a  typealias for a Closure that has no results, but it passed a Data.

## String Extensions Magic

Extensions Function calls for String type.

For example, isNotEmpty() is a computed variable that returns TRUE if string has contents.

## Array Extensions Magic

Extensions Function calls for Dictionary type.

For example, remove(item:) remove specific item from Array, regardless of location.

## Codable Extension Magic

New Extensions to Codable Protocols.

For example, spellWriteJSONData for converting Codable element into JSON data.

## SwiftUIUpdateableProtocol Magic

Protocol for UI element to signal that they should update themselves.

For example, a NSViewController sublass might signal any views it contains that they need to be updated (assuming the views also supports this protocol).

## UserDefault Magic

Static function for reading/writing/deleting various types to/from User Defaults.

## Demo App

Sample code using this SpellBook can be found in the open-source Cocoa App [CocoaGrimoire](https://github.com/magesteve/CocoaGrimoire). Other SpellBooks by the author are also demonstrated there.

## License

SwiftSpellBook is available as open source under the terms of the [MIT](https://github.com/magesteve/SwiftSpellBook/blob/main/LICENSE) License.
