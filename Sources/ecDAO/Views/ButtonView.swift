//
//  ButtonView.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/15/23.
//

import SwiftUI

public struct ButtonView: View {
    public var title: String
    public var action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.title2)
                .foregroundStyle(Color.black)
        }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Color("ea-primary"))
            .cornerRadius(15)
            .buttonStyle(PlainButtonStyle())
    }
}
