import XCTest
@testable import SwiftSpellBook

final class SwiftSpellBookTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftSpellBook().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
