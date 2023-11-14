//
//  PrefView.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 14/11/23.
//

import SwiftUI

struct PrefView: View {
    private enum Tabs: Hashable {
        case general
    }
    var body: some View {
        TabView {
            GeneralPrefView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
        }
        .padding(20)
        .frame(width: 750, height: 640)
    }
}

#Preview {
    PrefView()
}
