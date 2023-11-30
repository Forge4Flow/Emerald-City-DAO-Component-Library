//
//  SignInView.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI
import FCL
import FlowComponents

public struct SignInView: View {
    @State public var title: String
    @State public var description: String
    
    public init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    public var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding(.bottom, 5)
            
            Text(description)
                .font(.caption)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            Image("ea-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 100)
            
            ButtonView(title: "Connect Wallet") {
                fcl.openDiscovery()
            }
        }
        .frame(maxWidth: 600)
    }
}

#Preview {
    SignInView(title: "Test", description: "Test Description")
}
