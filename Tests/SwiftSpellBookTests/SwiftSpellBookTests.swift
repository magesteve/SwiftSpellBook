import XCTest
@testable import SwiftSpellBook

final class SwiftSpellBookTests: XCTestCase {
    
    func testNotEmpty() {
        XCTAssert("".isNotEmpty==false, "Testing isNotEmpty 1")
        XCTAssert("Here".isNotEmpty==true, "Testing isNotEmpty 2")
        XCTAssert(" _".isNotEmpty==true, "Testing isNotEmpty 3")
    }

    func testCamelSplit() {
        XCTAssertEqual("".spellSplitCamelCase, "", "Testing spellSplitCamelCase Empty")
        XCTAssertEqual("test".spellSplitCamelCase, "Test", "Testing spellSplitCamelCase Simple lower")
        XCTAssertEqual("Test".spellSplitCamelCase, "Test", "Testing spellSplitCamelCase Simple upper")
        XCTAssertEqual("myTest".spellSplitCamelCase, "My Test", "Testing spellSplitCamelCase normal two word")
        XCTAssertEqual("myTestExample".spellSplitCamelCase, "My Test Example", "Testing spellSplitCamelCase normal three word")
        XCTAssertEqual("myTest1".spellSplitCamelCase, "My Test 1", "Testing spellSplitCamelCase normal numbers 1")
        XCTAssertEqual("my1Test".spellSplitCamelCase, "My 1 Test", "Testing spellSplitCamelCase normal numbers 2")
        XCTAssertEqual("my1Test".spellSplitCamelCase, "My 1 Test", "Testing spellSplitCamelCase normal numbers 3")
        XCTAssertEqual("my1test".spellSplitCamelCase, "My 1 Test", "Testing spellSplitCamelCase normal numbers 4")
        XCTAssertEqual("my22Test".spellSplitCamelCase, "My 22 Test", "Testing spellSplitCamelCase normal numbers 5")
        XCTAssertEqual("My_Test".spellSplitCamelCase, "My Test", "Testing spellSplitCamelCase Underscore 1")
        XCTAssertEqual("My_test".spellSplitCamelCase, "My Test", "Testing spellSplitCamelCase Underscore 2")
        XCTAssertEqual("my_Test".spellSplitCamelCase, "My Test", "Testing spellSplitCamelCase Underscore 3")
        XCTAssertEqual("my_test".spellSplitCamelCase, "My Test", "Testing spellSplitCamelCase Underscore 4")
        XCTAssertEqual("myXXX_test".spellSplitCamelCase, "My X X X Test", "Testing spellSplitCamelCase Underscore abbreviates")
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

        nn.spellRemove(item: n3)
        
        XCTAssertEqual(TestNum.totalDescription(nn), "2+4", "RemoveArray middle correct")
        
        nn.spellRemove(item: dif4)
        
        XCTAssertEqual(TestNum.totalDescription(nn), "2+4", "RemoveArray none content correct")
    }
    
    func testAddLine() {
        
        var line = ""
        var line2 = ""

        line.spellAdd(newline: "")
        line2 = line2.spellMake(newline: "")
        
        XCTAssertEqual(line, "", "addLine test 1")
        XCTAssertEqual(line2, "", "makeNewLine test 1")

        line.spellAdd(newline: "AAA")
        line2 = line2.spellMake(newline: "AAA")

        XCTAssertEqual(line, "AAA", "addLine test 2")
        XCTAssertEqual(line2, "AAA", "makeNewLine test 2")

        line.spellAdd(newline: "")
        line2 = line2.spellMake(newline: "")

        XCTAssertEqual(line, "AAA", "addLine test 3")
        XCTAssertEqual(line2, "AAA", "makeNewLine test 3")

        line.spellAdd(newline: "BBB")
        line2 = line2.spellMake(newline: "BBB")

        XCTAssertEqual(line, "AAA\nBBB", "addLine test 4")
        XCTAssertEqual(line2, "AAA\nBBB", "makeNewLine test 4")

        line.spellAdd(newline: "CCC")
        line2 = line2.spellMake(newline: "CCC")

        XCTAssertEqual(line, "AAA\nBBB\nCCC", "addLine test 5")
        XCTAssertEqual(line2, "AAA\nBBB\nCCC", "makeNewLine test 5")
    }
    
    func testDataToHex() {
        let bytes1:[UInt8] = [0xff, 0xD9]
        let data1 = Data(bytes1)
        let result1 = data1.spellHexEncodedString()
        XCTAssertEqual(result1, "ffd9", "Data To Hex Test 1")

        let bytes2:[UInt8] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
        let data2 = Data(bytes2)
        let result2 = data2.spellHexEncodedString()
        XCTAssertEqual(result2, "000102030405060708090a0b0c0d0e0f10", "Data To Hex Test 2")

        let bytes3:[UInt8] = [0x11, 0x77, 0x88, 0xff]
        let data3 = Data(bytes3)
        let result3 = data3.spellHexEncodedString()
        XCTAssertEqual(result3, "117788ff", "Data To Hex Test 3")
    }
        
    static var allTests = [
        ("testNotEmpty", testNotEmpty),
        ("testCamelSplit", testCamelSplit),
        ("testRemoveArray", testRemoveArray),
        ("testDataToHex", testDataToHex),
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

