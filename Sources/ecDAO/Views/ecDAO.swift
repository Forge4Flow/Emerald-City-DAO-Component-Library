//
//  ecDAO.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/17/23.
//

import SwiftUI
import FlowComponents

public extension FlowApp {
    func ecDAOinit() -> some View {
        flowManager.themeConfig = ThemeConfig(primaryColor: Color.eaPrimary, secondaryColor: Color.eaSecondary, tertiaryColory: Color.eaTertiary)
        
        return self
    }
}
