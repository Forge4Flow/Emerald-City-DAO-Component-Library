//
//  RouterView.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/29/23.
//

import SwiftUI
import FCL
import FlowComponents

public struct RouterView<Content: View>: View {
    @Environment(FlowManager.self) var flowManager
    
    @Binding private var title: String
    @Binding private var description: String
    private var mainView: ()-> Content

    public init(title: Binding<String>, desc: Binding<String>, @ViewBuilder mainView: @escaping ()->Content) {
        self._title = title
        self._description = desc
        self.mainView = mainView
    }
    
    public var body: some View {
        ZStack {
            BackgroundView()
            
            Group {
                if !flowManager.isAuthenticated{
                    SignInView(title: title, description: description)
                } else {
                    mainView()
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
