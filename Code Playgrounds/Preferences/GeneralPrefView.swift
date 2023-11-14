//
//  GeneralPrefView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 14/11/23.
//

import SwiftUI
import CodeEditor

struct GeneralPrefView: View {
    @State private var source = """
    import SwiftUI

    struct SomeView: View {
        var body: some View {
            Text("Hello, world!")
        }
    }
    """
    
    @AppStorage("editorTheme") private var editorTheme = CodeEditor.ThemeName.ocean
    
    var body: some View {
        VStack {
            Picker("Theme", selection: $editorTheme) {
                ForEach(CodeEditor.availableThemes) { theme in
                  Text("\(theme.rawValue.capitalized)")
                    .tag(theme)
                }
            }
            CodeEditor(source: $source, language: .swift, theme: editorTheme).frame(width: 375, height: 400)
        }
        
    }
}

#Preview {
    GeneralPrefView()
}
