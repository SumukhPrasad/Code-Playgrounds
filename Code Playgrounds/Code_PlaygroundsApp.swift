//
//  Code_PlaygroundsApp.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 13/11/23.
//

import SwiftUI

@main
struct Code_PlaygroundsApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}

		#if os(macOS)
			Settings {
				PrefView()
			}
		#endif
	}
}
