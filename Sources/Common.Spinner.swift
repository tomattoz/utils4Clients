//  Created by Ivan Khvorostinin on 07.04.2025.

import SwiftUI

struct Spinner: View {
    let color: Color
    @State private var rotationAngle = 0.0
    private let size: CGFloat
    private let colors: [Color]
    
    init(color: Color = .blue, size: CGFloat = 80) {
        self.size = size
        self.color = color
        self.colors = [color.opacity(0.3), color]
    }

    var body: some View {
        ZStack {
            ZStack {
                Circle()
                   .stroke(
                       AngularGradient(
                           gradient: Gradient(colors: colors),
                           center: .center,
                           startAngle: .degrees(0),
                           endAngle: .degrees(360)
                       ),
                       style: StrokeStyle(lineWidth: 16, lineCap: .round)
                       
                   )
                   .frame(width: size, height: size)

                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(color)
                    .offset(x: size / 2)

            }
            .rotationEffect(.degrees(rotationAngle))
            .padding(.horizontal, 80)
            .padding(.vertical, 50)
            .onAppear {
                withAnimation(.linear(duration: 3)
                            .repeatForever(autoreverses: false)) {
                        rotationAngle = 360.0
                    }
            }
            .onDisappear{
                rotationAngle = 0.0
            }
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
