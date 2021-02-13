import XCTest
@testable import SwiftSpellBook

final class SwiftSpellBookTests: XCTestCase {
    
    func testNotEmpty() {
        XCTAssert("".isNotEmpty==false, "Testing isNotEmpty 1")
        XCTAssert("Here".isNotEmpty==true, "Testing isNotEmpty 2")
        XCTAssert(" _".isNotEmpty==true, "Testing isNotEmpty 3")
    }

    func testCamelSplit() {
        XCTAssertEqual("".splitCamelCase, "", "Testing splitCamelCase Empty")
        XCTAssertEqual("test".splitCamelCase, "Test", "Testing splitCamelCase Simple lower")
        XCTAssertEqual("Test".splitCamelCase, "Test", "Testing splitCamelCase Simple upper")
        XCTAssertEqual("myTest".splitCamelCase, "My Test", "Testing splitCamelCase normal two word")
        XCTAssertEqual("myTestExample".splitCamelCase, "My Test Example", "Testing splitCamelCase normal three word")
        XCTAssertEqual("myTest1".splitCamelCase, "My Test 1", "Testing splitCamelCase normal numbers 1")
        XCTAssertEqual("my1Test".splitCamelCase, "My 1 Test", "Testing splitCamelCase normal numbers 2")
        XCTAssertEqual("my1Test".splitCamelCase, "My 1 Test", "Testing splitCamelCase normal numbers 3")
        XCTAssertEqual("my1test".splitCamelCase, "My 1 Test", "Testing splitCamelCase normal numbers 4")
        XCTAssertEqual("my22Test".splitCamelCase, "My 22 Test", "Testing splitCamelCase normal numbers 5")
        XCTAssertEqual("My_Test".splitCamelCase, "My Test", "Testing splitCamelCase Underscore 1")
        XCTAssertEqual("My_test".splitCamelCase, "My Test", "Testing splitCamelCase Underscore 2")
        XCTAssertEqual("my_Test".splitCamelCase, "My Test", "Testing splitCamelCase Underscore 3")
        XCTAssertEqual("my_test".splitCamelCase, "My Test", "Testing splitCamelCase Underscore 4")
        XCTAssertEqual("myXXX_test".splitCamelCase, "My X X X Test", "Testing splitCamelCase Underscore abbreviates")
    }

    func testJSON() {
        let spot = TestClass(2, 3)
        guard let spotStr = spot.writeJSONString() else {
            XCTFail("Testing writing Codable into JSON failed")
            return
        }
        
        XCTAssertEqual(spotStr, "{\"x\":2,\"y\":3}", "Testing converting Codable into JSON correct")
        
        guard let newSpot = spot.readJSONString(from: spotStr) as? TestClass else {
            XCTFail("Testing reading Codable from JSON failed")
            return
        }

        XCTAssertEqual(newSpot.x, 2, "Testing reading Codable from JSON correct x")
        XCTAssertEqual(newSpot.y, 3, "Testing reading Codable from JSON correct 3")
    }
        
    func testRemoveArray() {
        let n1 = TestNum(1)
        let n2 = TestNum(2)
        let n3 = TestNum(3)
        let n4 = TestNum(4)
        let dif4 = TestNum(4)

        var nn = [n1, n2, n3, n4]
        
        XCTAssertEqual(TestNum.totalDescription(nn), "1+2+3+4", "RemoveArray start correct")
        
        nn.removeFirst()
        
        XCTAssertEqual(TestNum.totalDescription(nn), "2+3+4", "RemoveArray remove first correct")

        nn.remove(item: n3)
        
        XCTAssertEqual(TestNum.totalDescription(nn), "2+4", "RemoveArray middle correct")
        
        nn.remove(item: dif4)
        
        XCTAssertEqual(TestNum.totalDescription(nn), "2+4", "RemoveArray none content correct")
    }
    
    static var allTests = [
        ("testNotEmpty", testNotEmpty),
        ("testCamelSplit", testCamelSplit),
        ("testJSON", testJSON),
        ("testRemoveArray", testRemoveArray),
    ]
    
    public class TestClass: Codable {
        var x: Int
        var y: Int
        
        public init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }

    public class TestNum {
        public var n = 0
        
        public init(_ n: Int) {
            self.n = n
        }
        
        public static func totalDescription(_ nums: [TestNum]) -> String {
            var result: String = ""
            
            for n in nums {
                if result.count>0 {
                    result = result + "+"
                }
                
                result = result + String(n.n)
            }
            
            return result
        }
    }
}

