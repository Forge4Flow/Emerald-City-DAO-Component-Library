//
//  CodeSheet.swift
//  ecDAO
//
//  Created by BoiseITGuru on 11/29/23.
//

import SwiftUI
import FlowComponents

public class CodeViewConfig: ObservableObject {
    @Published public var codeType: CodeType = .swift
    @Published public var title: String
    @Published public var description: String
    @Published public var swiftCode: CadenceCode
    @Published public var cadenceCode: CadenceCode
    
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
    @Binding private var codeType: CodeType
    @Binding private var title: String
    @Binding private var description: String
    @Binding private var swiftCode: CadenceCode
    @Binding private var cadenceCode: CadenceCode
    
    public init(codeType: Binding<CodeType>, title: Binding<String>, description: Binding<String>, swiftCode: Binding<CadenceCode>, cadenceCode: Binding<CadenceCode>) {
        self._codeType = codeType
        self._title = title
        self._description = description
        self._swiftCode = swiftCode
        self._cadenceCode = cadenceCode
    }
    
    public var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text(title)
                    .font(.title)
                    .padding(.vertical, 10)
                
                Text(description)
                
                Picker("Select Code Type", selection: $codeType) {
                    ForEach(CodeType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(5)
                
                TabView(selection: $codeType) {
                    CodeBlock(code: swiftCode.code, grammar: .swift)
                        .tag(CodeType.swift)
                    
                    CodeBlock(cadenceCode: cadenceCode)
                        .tag(CodeType.cadence)
                }
                .padding(.horizontal, 5)
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
            .padding(.horizontal, 10)
        }
    }
}
