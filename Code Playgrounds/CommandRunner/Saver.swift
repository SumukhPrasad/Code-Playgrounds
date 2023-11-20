//
//  Saver.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 15/11/23.
//

import Foundation

func createTemporarySHFile(content: String, command: String) -> URL? {
    let textfilePath = createTemporaryTextFile(content: content)
    
    let strURL = textfilePath?.absoluteString
    let idx = (strURL?.index(strURL?.startIndex ?? "".startIndex, offsetBy: 7))!
    
    let computedFileURL = strURL?[idx...]
    
    let filePath = createTemporaryTextFile(content: "clear; \(command) \(computedFileURL!); echo \"Press RETURN to exit.\"; read junk")

    return filePath
}


func createTemporaryTextFile(content: String) -> URL? {
    do {
        let tempDirectory = FileManager.default.temporaryDirectory
        let fileName = UUID().uuidString
        let filePath = tempDirectory.appendingPathComponent(fileName)
        try content.write(to: filePath, atomically: true, encoding: .utf8)

        return filePath
    } catch {
        print("Error creating temporary text file: \(error)")
        return nil
    }
}
