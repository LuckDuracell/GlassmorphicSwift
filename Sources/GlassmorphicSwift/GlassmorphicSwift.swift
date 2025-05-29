// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct GlassTextFieldStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(.white)
            .brightness(-0.3)
            .padding(10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.border, lineWidth: 1.5)
                    .foregroundColor(.fg)
            )
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct GlassButtonStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundColor(.white)
            .brightness(-0.3)
            .padding(10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.border, lineWidth: 1.5)
                    .foregroundColor(.fg)
            )
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension View {
    public func glassTextFieldStyle() -> some View {
        self.modifier(GlassTextFieldStyle())
    }
    public func glassButtonStyle() -> some View {
        self.modifier(GlassButtonStyle())
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension Color {
    static let fg = Color(light: 0xEAECF3, dark: 0x42413D)
    static let border = Color(light: 0xF1F2FA, dark: 0x525150)
    static let bg = Color(light: 0xE0E2E9, dark: 0x2F2E2A)

    init(light: Int, dark: Int, opacity: Double = 1.0) {
        self = Color(UIColor { traitCollection in
            let hex = traitCollection.userInterfaceStyle == .dark ? dark : light
            return UIColor(
                red: CGFloat((hex >> 16) & 0xff) / 255,
                green: CGFloat((hex >> 8) & 0xff) / 255,
                blue: CGFloat((hex >> 0) & 0xff) / 255,
                alpha: opacity
            )
        })
    }
}
