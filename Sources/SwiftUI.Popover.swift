//  Created by Ivan Kh on 06.09.2023.

import SwiftUI

#if os(macOS)
public extension View {
    func popover<TContent: View>(show: Binding<Bool>,
                                 popover: NSPopover,
                                 size: CGSize,
                                 shouldClose: @escaping () -> Bool = { true },
                                 @ViewBuilder content: @escaping () -> TContent) -> some View {
        modifier(PopoverModifier(show: show,
                                 popover: popover,
                                 size: size,
                                 shouldClose: shouldClose,
                                 content: content))
    }
}

private struct PopoverModifier<TContent: View>: ViewModifier {
    let show: Binding<Bool>
    let popover: NSPopover
    let size: CGSize
    var shouldClose: () -> Bool = { true }
    @ViewBuilder var content: () -> TContent

    func body(content: Content) -> some View {
        content.background(
            PopoverWrapper(show: show,
                           popover: popover,
                           size: size,
                           shouldClose: shouldClose,
                           content: self.content)
        )
    }
}

private struct PopoverWrapper<TContent: View>: NSViewRepresentable {
    class CustomView: NSView, NSPopoverDelegate {
        var show: Binding<Bool> = .constant(false)
        var shouldClose: () -> Bool = { true }
        var popover: NSPopover?
        var shown = false

        func popoverShouldClose(_ popover: NSPopover) -> Bool {
            shouldClose()
        }

        func popoverWillShow(_ notification: Notification) {
            shown = true
        }

        func popoverDidClose(_ notification: Notification) {
            DispatchQueue.main.async { [self] in
                shown = false
                show.wrappedValue = false
            }
        }
    }

    @Binding var show: Bool
    let popover: NSPopover
    var size: CGSize
    var shouldClose: () -> Bool = { true }
    @ViewBuilder var content: () -> TContent

    func makeNSView(context: Context) -> CustomView {
        let result = CustomView()

        popover.behavior = .transient
        popover.contentSize = size
        popover.contentViewController = NSHostingController(rootView: content())

        result.popover = popover
        result.shouldClose = shouldClose
        result.show = $show

        return result
    }

    func updateNSView(_ nsView: CustomView, context: Context) {
        popover.delegate = nsView

        if show, nsView.shown == false {
            DispatchQueue.main.async {
                nsView.popover?.show(relativeTo: nsView.bounds, of: nsView, preferredEdge: .maxY)
            }
        }

        if !show, nsView.shown {
            nsView.popover?.close()
        }
    }
}
#endif
