//
//  Runner.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 15/11/23.
//

import Foundation

func executeCommandInNewTerminal(command: String) {
    
    
    let script = """
    tell application "Terminal"
        do script "\(command)"
    end tell
    """
    
    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: script) {
        if let output: NSAppleEventDescriptor? = scriptObject.executeAndReturnError(&error) {
            print(output!.stringValue)
        } else if (error != nil) {
            print("error: \(error)")
        }
    }
}
