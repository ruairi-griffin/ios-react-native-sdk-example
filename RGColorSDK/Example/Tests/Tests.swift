import XCTest
@testable import RGColorSDK

class Tests: XCTestCase {
    override func setUp() {
        // Uses a "rng" that always outputs 33.0
        ColorCalculator._isTesting = true
    }
    
    func testHexConversion_White() {
        let color = ColorCalculator.generateColor(colorType: .hex, redIn: 0, greenIn: 0, blueIn: 0)
        XCTAssertEqual(color, "#000000")
    }
    
    func testHexConversion_Black() {
        let color = ColorCalculator.generateColor(colorType: .hex, redIn: 255, greenIn: 255, blueIn: 255)
        XCTAssertEqual(color, "#FFFFFF")
    }
    
    func testHexConversion_Orange() {
        let color = ColorCalculator.generateColor(colorType: .hex, redIn: 245, greenIn: 122, blueIn: 16)
        XCTAssertEqual(color, "#F57A10")
    }
    
    func testHexConversion_AllRandom() {
        let color = ColorCalculator.generateColor(colorType: .hex, redIn: nil, greenIn: nil, blueIn: nil)
        XCTAssertEqual(color, "#212121")
    }
    
    func testHexConversion_SomeRandom() {
        let color = ColorCalculator.generateColor(colorType: .hex, redIn: 0, greenIn: 0, blueIn: nil)
       XCTAssertEqual(color, "#000021")
    }
    
    func testRGBConversion_White() {
        let color = ColorCalculator.generateColor(colorType: .rgb, redIn: 255, greenIn: 255, blueIn: 255)
        XCTAssertEqual(color, "rgb(255, 255, 255)")
    }
    
    func testRGBConversion_AllRandom() {
        let color = ColorCalculator.generateColor(colorType: .rgb, redIn: nil, greenIn: nil, blueIn: nil)
        XCTAssertEqual(color, "rgb(33, 33, 33)")
    }
    
    func testRGBConversion_SomeRandom() {
        let color = ColorCalculator.generateColor(colorType: .rgb, redIn: nil, greenIn: 100, blueIn: 100)
        XCTAssertEqual(color, "rgb(33, 100, 100)")
    }
}
