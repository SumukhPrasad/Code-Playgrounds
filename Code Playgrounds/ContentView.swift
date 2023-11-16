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
    @State var showingPanel = false
    @State private var lang = CodeEditor.Language.swift
    
    @State private var command = ""
    
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
            
        }.frame(minWidth: 640)
        
        .toolbar {
            HStack {
                Text("Highlight:")
                
                Picker("Highlight", selection: $lang) {
                  ForEach(CodeEditor.availableLanguages) { language in
                    Text("\(language.rawValue.capitalized)")
                      .tag(language)
                  }
                }
                
                TextField("Command", text: $command).monospaced().textFieldStyle(.roundedBorder).disableAutocorrection(true)
                
                Button(action: runCode) {
                    Label("Run", systemImage: "hammer")
                }
            }
            
            /*Button(action: {}) {
                Label("Open REPL", systemImage: "apple.terminal")
            }*/
        }
        
    }
}

private extension ContentView {
    func runCode() {
        guard !code.isEmpty else {
            return
        }
        
        guard !command.isEmpty else {
            return
        }
        
        let fileURL: URL? = createTemporaryTextFile(content: code)
        let strURL = fileURL?.absoluteString
        let idx = (strURL?.index(strURL?.startIndex ?? "".startIndex, offsetBy: 7))!
        
        let computedFileURL = strURL?[idx...]
        if (fileURL != nil) {
            print("clear; \(command) \(computedFileURL ?? "!!!!!")")
            executeCommandInNewTerminal(command: "clear; \(command) \(computedFileURL!)")
        }
    }
}


/*
#Preview {
    ContentView()
}
*/
