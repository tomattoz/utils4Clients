//  Created by Ivan Kh on 25.07.2023.

#if os(macOS)
import AppKit
import SwiftUI

public struct VisualEffectView: NSViewRepresentable {
    let material: NSVisualEffectView.Material
    let blendingMode: NSVisualEffectView.BlendingMode = .behindWindow
    let state: NSVisualEffectView.State = .active
    let emphasized: Bool = true

    public init(material: NSVisualEffectView.Material) {
        self.material = material
    }
    
    public func makeNSView(context: Context) -> NSVisualEffectView {
        context.coordinator.visualEffectView
    }

    public func updateNSView(_ view: NSVisualEffectView, context: Context) {
        context.coordinator.update(
            material: material,
            blendingMode: blendingMode,
            state: state,
            emphasized: emphasized
        )
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public class Coordinator {
        let visualEffectView = NSVisualEffectView()

        init() {
            visualEffectView.blendingMode = .withinWindow
            visualEffectView.state = .active

        }

        func update(material: NSVisualEffectView.Material,
                    blendingMode: NSVisualEffectView.BlendingMode,
                    state: NSVisualEffectView.State,
                    emphasized: Bool) {
            visualEffectView.material = material
            visualEffectView.blendingMode = blendingMode
            visualEffectView.state = state
            visualEffectView.isEmphasized = emphasized
        }
    }
}

public extension VisualEffectView {
    func defaultBorder() -> some View {
        self.overlay {
            ZStack {
                RoundedRectangle(cornerRadius: 10).stroke(Color("spotlight.border"))
            }
        }
    }
}
#endif
