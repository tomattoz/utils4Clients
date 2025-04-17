//  Created by Ivan Kh on 31.08.2023.

import SwiftUI

public struct PositionObservingView<Content: View>: View {
    let coordinateSpace: CoordinateSpace
    let position: Binding<CGPoint>
    @ViewBuilder var content: () -> Content

    public init(coordinateSpace: CoordinateSpace,
                position: Binding<CGPoint>,
                @ViewBuilder content: @escaping () -> Content) {
        self.coordinateSpace = coordinateSpace
        self.position = position
        self.content = content
    }
    
    public var body: some View {
        content()
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: PreferenceKey.self,
                    value: geometry.frame(in: coordinateSpace).origin
                )
            })
            .onPreferenceChange(PreferenceKey.self) { position in
                self.position.wrappedValue = CGPoint(x: position.x, y: -position.y)
            }
    }
}

private extension PositionObservingView {
    enum PreferenceKey: SwiftUI.PreferenceKey {
        static var defaultValue: CGPoint { .zero }

        static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
            // No-op
        }
    }
}
