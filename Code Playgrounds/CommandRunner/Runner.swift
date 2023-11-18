//
//  Runner.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 15/11/23.
//

import Foundation

func executeCommandInNewTerminal(command: String) {
    
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-a Terminal"]
    task.launchPath = "/usr/bin/open"
    task.standardInput = nil
    task.launch()
    
    print(command)
    
}
