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
    @State private var lang = CodeEditor.Language.python
    
    @State private var command = "python3"
    
    var body: some View {
        VStack {
            EditorView(code: $code, language: $lang).frame(minHeight: 480)
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
        
        let fileURL: URL? = createTemporarySHFile(content: code, command: command)
        let strURL = fileURL?.absoluteString
        let idx = (strURL?.index(strURL?.startIndex ?? "".startIndex, offsetBy: 7))!
        
        let computedFileURL = strURL?[idx...]
        if (fileURL != nil) {
            executeCommandInNewTerminal(file: "\(computedFileURL!)")
        }
    }
}


/*
#Preview {
    ContentView()
}
*/
