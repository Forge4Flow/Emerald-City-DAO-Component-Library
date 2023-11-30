//
//  AcademyHeader.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/29/23.
//

import SwiftUI
import FCL
import FlowComponents

public struct AcademyHeader: View {
    @EnvironmentObject var appProps: AppProperties
    
    public init() {}
    
    public var body: some View {
        HStack(spacing: 0) {
            Image("ea-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .padding(.trailing, 6)
            Text("Emerald Academy")
                .font(.title)
                .foregroundStyle(Color.eaPrimary)
            
            Spacer()
            
            ButtonView {
                Image(systemName: "rectangle.portrait.and.arrow.forward")
                    .foregroundStyle(Color.black)
                    .padding(10)
            } action: {
                Task {
                    try await fcl.unauthenticate()
                }
            }
            .frame(maxWidth: 20)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    AcademyHeader()
}
