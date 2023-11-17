//
//  Background View.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI

public struct BlurCircle: View {
    var diameter: CGFloat
    var blurRadius: CGFloat
    var opacity: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    var color: Color

    public var body: some View {
        Circle()
            .fill(color)
            .frame(width: diameter, height: diameter)
            .blur(radius: blurRadius)
            .opacity(opacity)
            .offset(x: xOffset, y: yOffset)
            .position(x: diameter / 2, y: diameter / 2) // Center the circle on its position
    }
}

public struct BackgroundView: View {
    // These color variables will be defined by you
    var primaryColor = Color("ea-primary")
    var secondaryColor = Color("ea-secondary")
    var tertiaryColor = Color("ea-tertiary")
    
    public init() {}

    public var body: some View {
        ZStack {
            BlurCircle(
                diameter: 300,
                blurRadius: 100,
                opacity: 0.4,
                xOffset: -30,
                yOffset: 50,
                color: primaryColor
            )

            BlurCircle(
                diameter: 300,
                blurRadius: 100,
                opacity: 0.4,
                xOffset: 150,
                yOffset: 550,
                color: tertiaryColor
            )
        }
        .edgesIgnoringSafeArea(.all) // Extend to the edges of the screen
    }
}

#Preview {
    BackgroundView()
}
