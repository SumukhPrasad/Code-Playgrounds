//
//  Saver.swift
//  Code Playgrounds
//
//  Created by Sumukh Prasad on 15/11/23.
//

import Foundation

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
