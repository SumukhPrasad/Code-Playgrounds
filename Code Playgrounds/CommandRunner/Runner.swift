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
    
    print("Trying to execute\n\(script)")

    var error: NSDictionary?
    if let scriptObject = NSAppleScript(source: script) {
        if let output: NSAppleEventDescriptor? = scriptObject.executeAndReturnError(&error) {
            print(output?.stringValue ?? "no value in output")
        } else if (error != nil) {
            print("error: \(String(describing: error))")
        }
    }
}
