//  Created by Ivan Khvorostinin on 19.03.2025.

import SwiftUI

public extension View {
    @inlinable nonisolated func textContentTypeEmail() -> some View {
        if #available(macOS 14.0, *) {
            return textContentType(.emailAddress)
        } else {
            return self
        }
    }
}

public extension View {
    @ViewBuilder func buttonStyleAccessoryBarActionOrBordered() -> some View {
        if #available(macOS 14.0, *) {
            self.buttonStyle(.accessoryBarAction)
        } else {
            self.buttonStyle(.bordered)
        }
    }
}
