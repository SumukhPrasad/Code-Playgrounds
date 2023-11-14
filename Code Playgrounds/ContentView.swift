//
//  ContentView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var windowTitleString: String = "Code Playgrounds"
    @State private var lang = 1
    @State private var code = ""
    @State var showingPanel = false
    
    var body: some View {
        VStack {
            TextEditor(text: $code)
                .foregroundStyle(.secondary)
                .monospaced()
            
            HStack(
                    alignment: .top,
                    spacing: 10
                ) {
                    Button("panel") {
                        showingPanel.toggle()
                    }
                    .floatingPanel(isPresented: $showingPanel, content: {
                        ZStack {
                            VisualEffectView(material: .sidebar, blendingMode: .behindWindow)
                        }
                    })
                }
            
            TextEditor(text: $code)
                .foregroundStyle(.secondary)
                .monospaced()
        }
        
        .toolbar {
            Text(windowTitleString)
            
            Picker(selection: $lang, label: Text("Language"))
            {
                Text("Python").tag(1)
                Text("Swift").tag(2)
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
