import RGColorSDK
import Foundation

@objc(AtomicRnColorLibrary)
class AtomicRnColorLibrary: NSObject {
    
    @objc(generateColor:withRed:withGreen:withBlue:withResolver:withRejecter:)
    func generateColor(_ typeString: NSString,
                       red: NSNumber,
                       green: NSNumber,
                       blue: NSNumber,
                       resolve: RCTPromiseResolveBlock,
                       reject: RCTPromiseRejectBlock) {
        
        // TODO: add error handling
        let colorType: ColorType
        if typeString == "hex" {
            colorType = .hex
        } else {
            colorType = .rgb
        }
        guard let redDouble = red as? Double,
              let blueDouble = blue as? Double,
              let greenDouble = green as? Double
        else {
            resolve("#FF00FF")
            return
        }
        
        let red = validateColorValue(redDouble)
        let blue = validateColorValue(blueDouble)
        let green = validateColorValue(greenDouble)
        let colorString = ColorCalculator.generateColor(colorType: colorType, redIn: red, greenIn: green, blueIn: blue)
        
        resolve(colorString)
    }
    
    private func validateColorValue(_ value: Double) -> Double? {
        if value < 0 || value > 255 {
            return nil
        } else {
            return value
        }
    }
}


