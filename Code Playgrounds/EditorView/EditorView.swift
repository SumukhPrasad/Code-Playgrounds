//
//  EditorView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 14/11/23.
//

import SwiftUI

struct EditorView: View {
    @Binding var code: String
    
    var body: some View {
        TextEditor(text: $code)
            .foregroundStyle(.primary)
            .monospaced()
    }
}

/*
#Preview {
    EditorView(code: code)
}
*/
