import SwiftUI

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}


extension Color {
    
    enum AppColor: String {
        // ここに使いたいカラーコードと名前を記載
        case background = "F3F3F3"
        // ↑
    }
    
    static func myColor(colorCode :Color.AppColor) -> Color {
        return Color(UIColor(hex: colorCode.rawValue))
    }
}

// 使い方↓
// .background(Color.myColor(colorCode: .background))
