import Foundation

public enum ColorType: Int {
    case rgb
    case hex
}

protocol RandomNumberGeneratorProtocol {
    func randomDouble() -> Double
}

public class ColorCalculator: NSObject {
    
    static var _isTesting: Bool = false
    
    static var rng: RandomNumberGeneratorProtocol {
        if ColorCalculator._isTesting {
            return TestOnlyRandomNumberGenerator()
        } else {
            return RandomNumberGenerator()
        }
    }
    
    public static func generateColor(colorType: ColorType, redIn: Double? = nil, greenIn: Double? = nil, blueIn: Double? = nil) -> String {
        
        let red = colorOrRandom(optionalColor: redIn)
        let green = colorOrRandom(optionalColor: greenIn)
        let blue = colorOrRandom(optionalColor: blueIn)
        
        switch colorType {
        case .rgb:
            return generateRGBColor(
                red: red,
                green: green,
                blue: blue)
        case .hex:
            return generateHexColor(
                red: red,
                green: green,
                blue: blue)
        }
    }
    
    private static func generateHexColor(red: Double, green: Double, blue: Double) -> String {
        return "#\(toHex(red))\(toHex(green))\(toHex(blue))"
    }
    
    private static func generateRGBColor(red: Double, green: Double, blue: Double) -> String {
        return "rgb(\(formatDouble(red)), \(formatDouble(green)), \(formatDouble(blue)))"
    }
    
    private static func colorOrRandom(optionalColor: Double?) -> Double {
        if let color = optionalColor {
            return color
        } else {
            return ColorCalculator.rng.randomDouble()
        }
    }
    
    private static func toHex(_ double: Double) -> String {
        let number = Int(double)
        let hex = String(format:"%02X", number)
        return hex
    }
    
    private static func formatDouble(_ double: Double) -> String {
        let number = Int(double)
        return String(format: "%D", number)
    }
}

class RandomNumberGenerator: RandomNumberGeneratorProtocol {
    func randomDouble() -> Double {
        let value = Int.random(in: 0...255)
        return Double(value)
    }
}

class TestOnlyRandomNumberGenerator: RandomNumberGeneratorProtocol {
    func randomDouble() -> Double {
        return 33.0
    }
}
