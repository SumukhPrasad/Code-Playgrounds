//
//  Runner.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 15/11/23.
//

import Foundation

func executeCommandInNewTerminal(file: String) {
    
    let chmod_process = Process()
    chmod_process.launchPath = "/bin/chmod"
    chmod_process.arguments = ["+x", file]
    chmod_process.launch()
    chmod_process.waitUntilExit()
    
    
    let process = Process()
    process.launchPath = "/usr/bin/env"
    process.arguments = ["open", "-a", "Terminal", file]
    process.launch()
    process.waitUntilExit()
    
    print(file)
    
}
