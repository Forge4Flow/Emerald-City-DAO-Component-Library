//
//  Background View.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FlowComponents

public struct BlurCircle: View {
    var diameter: CGFloat
    var blurRadius: CGFloat
    var opacity: Double
    var color: Color

    public var body: some View {
        Circle()
            .fill(color)
            .frame(width: diameter, height: diameter)
            .blur(radius: blurRadius)
            .opacity(opacity)
    }
}

public struct BackgroundView: View {
    @Environment(FlowManager.self) private var flowManager
    
    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                BlurCircle(
                    diameter: geometry.size.width * 0.75, // Responsive size
                    blurRadius: 100,
                    opacity: 0.4,
                    color: flowManager.themeConfig.primaryColor
                )
                .position(x: geometry.size.width * 0.20, y: geometry.size.height * 0.20) // Responsive position

                BlurCircle(
                    diameter: geometry.size.width * 0.75, // Responsive size
                    blurRadius: 100,
                    opacity: 0.4,
                    color: flowManager.themeConfig.tertiaryColory
                )
                .position(x: geometry.size.width * 0.90, y: geometry.size.height * 0.90) // Responsive position
            }
            .edgesIgnoringSafeArea(.all) // Extend to the edges of the screen
        }
    }
}
#Preview {
    BackgroundView()
}
