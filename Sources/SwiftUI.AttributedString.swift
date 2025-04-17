//  Created by Ivan Kh on 24.09.2023.

import SwiftUI

public extension AttributedString {
    func swiftUIunderlined() -> AttributedString {
        var result = self
        result.underlineStyle = Text.LineStyle(pattern: .solid)
        return result
    }

    func swiftUI(underlined: Bool) -> AttributedString {
        underlined ? swiftUIunderlined() : self
    }
}
