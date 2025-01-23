//
//  FilesHelper.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

struct FilesHelper {
    
    private let jsonEncoder = JSONEncoder()
    private let jsonDecoder = JSONDecoder()
    let folderName = "SmarterTraining"
    
    func saveToFile<T: Encodable>(filename: String, content: T) -> Bool {
        let fileDirectory = FileManager.default.urls(for: .allLibrariesDirectory, in: .userDomainMask)
        let fileName = fileDirectory.first!.path + folderName + filename
        
        let existingFile = FileManager.default.fileExists(atPath: fileName)
        
        do {
            let jsonContent = try jsonEncoder.encode(content)
            
            if(existingFile) {
                try FileManager.default.removeItem(atPath: fileName)
            }
            
            return FileManager.default.createFile(atPath: fileName, contents: jsonContent)
            
        } catch {
            return false
        }
    }
    
    
    func getFileContent<T: Decodable>(filename: String, content: T) -> T? {
        let fileDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = fileDirectory.first!.path + folderName + filename
        
        let existingFile = FileManager.default.fileExists(atPath: fileName)
        
        if(!existingFile) {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: URL(string: fileName)!)
            
            if let string = String(data: data, encoding: .utf8) {
                return try jsonDecoder.decode(T.self, from: data)
            }
            else {
                return nil
            }
        }
        catch {
            return nil
        }
    }
    
    func removeAllFiles() -> Bool {
        do {
            //TODO reset files
            
            return true
        }
        catch {
            return false
        }
    }
}
