//
//  SettingsViewModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
    let filesHelper = FilesHelper()
    
    func resetApp() -> Bool {
        let filesRemoved = filesHelper.removeAllFiles()
        
        return filesRemoved
    }
}
