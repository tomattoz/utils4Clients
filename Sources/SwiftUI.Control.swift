//  Created by Ivan Khvorostinin on 02.04.2025.

import SwiftUI

#if os(macOS)
public struct NSControlRepresentation: NSViewRepresentable {
    public init() {
    }
    
    public func makeNSView(context: Context) -> NSControl {
        NSControl()
    }

    public func updateNSView(_ nsView: NSControl, context: Context) {
    }
}
#endif
