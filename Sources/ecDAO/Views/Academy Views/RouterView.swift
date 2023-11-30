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
    @State private var loggedIn: Bool = false
    @State private var showErrorView: Bool = false
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
                if !loggedIn {
                    SignInView(title: title, description: description)
                } else {
                    mainView()
                }
            }
            .padding(.horizontal, 20)
        }
        .responsiveApp()
//        .sheet(isPresented: $showErrorView, onDismiss: { flowManager.txError = nil }, content: {
//            ErrorView(error: flowManager.txError ?? "")
//        })
        .onReceive(fcl.$currentUser) { user in
            self.loggedIn = (user != nil)
        }
        .onReceive(flowManager.$txError) { error in
            self.showErrorView = (error != nil)
        }
    }
}
