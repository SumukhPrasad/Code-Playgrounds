//
//  EditorView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 14/11/23.
//

import SwiftUI
import CodeEditor

struct EditorView: View {
    @Binding var code: String
    @Binding var language: CodeEditor.Language
    @AppStorage("editorTheme") private var editorTheme = CodeEditor.ThemeName.ocean
    
    var body: some View {
        CodeEditor(source: $code, language: language, theme: editorTheme,
                   autoPairs: [ "{": "}", "(": ")", "'": "'", "\"": "\"", "[":"]"  ])
    }
}

/*
#Preview {
    EditorView(code: code)
}
*/
