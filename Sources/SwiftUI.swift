//  Created by Ivan Kh on 24.07.2023.

import SwiftUI

public extension View {
    func Print(_ string: String) -> some View {
        Swift.print(string)
        return self
    }

    func code(_ block: () -> Void) -> some View {
        block()
        return self
    }

    func frame(size: CGSize) -> some View {
        return self.frame(width: size.width, height: size.height)
    }

    #if os(macOS)
    func cursor(_ cursor: NSCursor) -> some View {
        self.onHover { isHovered in
            DispatchQueue.main.async {
                if (isHovered) {
                    cursor.push()
                } else {
                    NSCursor.pop()
                }
            }
        }
    }
    #endif
}
