import XCTest
@testable import SwiftSpellBook

final class SwiftSpellBookTests: XCTestCase {
    
    func testExample() {
        let s1 = ""
        let s2 = "Here"
        
        XCTAssert(s1.isNotEmpty()==false, "Testing isNotEmpty 1")
        XCTAssert(s2.isNotEmpty()==true, "Testing isNotEmpty 2")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
