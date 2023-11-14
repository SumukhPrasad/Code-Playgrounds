//
//  ContentView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 13/11/23.
//

import SwiftUI
import CodeEditor

struct ContentView: View {
    
    @State private var code = ""
    @State private var cons = "CONSOLE GOES HERE"
    @State var showingPanel = false
    @State private var lang = CodeEditor.Language.swift
    
    var body: some View {
        VStack {
            EditorView(code: $code, language: $lang).frame(minHeight: 480)
            
            HStack(
                    alignment: .center,
                    spacing: 10
                ) {
                    Text("")
                    Spacer()
                    Button("show panel") {
                        showingPanel.toggle()
                    }
                    .floatingPanel(isPresented: $showingPanel, content: {
                        ZStack {
                            VisualEffectView(material: .hudWindow, blendingMode: .behindWindow)
                        }
                    })
                }.padding(10)
            
            TextEditor(text: $cons)
                .foregroundStyle(.secondary)
                .monospaced()
                .frame(minHeight: 200)
        }.frame(minWidth: 640)
        
        .toolbar {
            Text("Language:")
            
            Picker("Language", selection: $lang) {
              ForEach(CodeEditor.availableLanguages) { language in
                Text("\(language.rawValue.capitalized)")
                  .tag(language)
              }
            }
            
            Button(action: {})
            {
                Label("Run", systemImage: "hammer")
            }
            
            Button(action: {})
            {
                Label("Open REPL", systemImage: "apple.terminal")
            }
        }
        
    }
}


/*
#Preview {
    ContentView()
}
*/
