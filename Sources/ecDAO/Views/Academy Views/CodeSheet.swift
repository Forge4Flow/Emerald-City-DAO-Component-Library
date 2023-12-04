//
//  CodeSheet.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/29/23.
//

import SwiftUI
import Observation
import FlowComponents

@Observable
public class CodeViewConfig {
    public var codeType: CodeType = .swift
    public var title: String
    public var description: String
    public var swiftCode: CadenceCode
    public var cadenceCode: CadenceCode
    
    public init(title: String, description: String, swiftCode: CadenceCode, cadenceCode: CadenceCode) {
        self.title = title
        self.description = description
        self.swiftCode = swiftCode
        self.cadenceCode = cadenceCode
    }
}

public enum CodeType: String, CaseIterable, Identifiable {
    case swift = "Swift"
    case cadence = "Cadence"
    
    public var id: String { self.rawValue }
}

public struct CodeSheet: View {
    @Binding private var config: CodeViewConfig
    
    public init(config: Binding<CodeViewConfig>) {
        self._config = config
    }
    
    public var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text(config.title)
                    .font(.title)
                    .padding(.vertical, 10)
                
                Text(config.description)
                
                Picker("Select Code Type", selection: $config.codeType) {
                    ForEach(CodeType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(5)
                
                TabView(selection: $config.codeType) {
                    CodeBlock(code: config.swiftCode.code, grammar: .swift)
                        .tag(CodeType.swift)
                    
                    CodeBlock(cadenceCode: config.cadenceCode)
                        .tag(CodeType.cadence)
                }
                .padding(.horizontal, 5)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            .padding(.horizontal, 10)
        }
    }
}
