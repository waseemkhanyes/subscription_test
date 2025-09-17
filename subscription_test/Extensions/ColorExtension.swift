//
//  ColorExtension.swift
//  subscription_test
//
//  Created by Waseem  on 17/09/2025.
//

import SwiftUI

extension Color {
   
    init(hex: UInt, opacity: Double = 1) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: opacity
            )
        }
    
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
}

extension Color {
    static func contrastRatio(between color1: Color, and color2: Color) -> CGFloat {
        let luminance1 = color1.luminance()
        let luminance2 = color2.luminance()

        let luminanceDarker = min(luminance1, luminance2)
        let luminanceLighter = max(luminance1, luminance2)

        return (luminanceLighter + 0.05) / (luminanceDarker + 0.05)
    }

    func contrastRatio(with color: Color) -> CGFloat {
        return Color.contrastRatio(between: self, and: color)
    }

    func luminance() -> CGFloat {
        
        let ciColor = CIColor(color: UIColor(self))

        func adjust(colorComponent: CGFloat) -> CGFloat {
            return (colorComponent < 0.04045) ? (colorComponent / 12.92) : pow((colorComponent + 0.055) / 1.055, 2.4)
        }

        return 0.2126 * adjust(colorComponent: ciColor.red) + 0.7152 * adjust(colorComponent: ciColor.green) + 0.0722 * adjust(colorComponent: ciColor.blue)
    }
}

extension Color {
    static func getColorWithContrast(hex: String, otherColor:Color = .white) -> Color {
        guard hex.count > 0 else { return .black }
        let color = Color(hex: hex)
        
        return color.getColorWithContrast(otherColor: otherColor)
    }
    
    func getColorWithContrast(otherColor:Color = .white) -> Color {
        let color = self
        if color.contrastRatio(with: otherColor) < 1.5 {
            return color.inverseColor()
        } else {
            return color
        }
    }

    func inverseColor() -> Color {
        var opacity: CGFloat = 1.0
        let uiColor = UIColor(self)
        var red: CGFloat = 0.0, green: CGFloat = 0.0, blue: CGFloat = 0.0
        if uiColor.getRed(&red, green: &green, blue: &blue, alpha: &opacity) {
            return Color(red: 1.0 - red, green: 1.0 - green, blue: 1.0 - blue, opacity: opacity)
        }

        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0
        if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &opacity) {
            return Color(hue: 1.0 - hue, saturation: 1.0 - saturation, brightness: 1.0 - brightness, opacity: opacity)
        }

        var white: CGFloat = 0.0
        if uiColor.getWhite(&white, alpha: &opacity) {
            return Color(white: 1.0 - white, opacity: opacity)
        }

        return self
    }
}
