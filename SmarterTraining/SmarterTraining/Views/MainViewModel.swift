//
//  MainViewModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var isFirstLogin: Bool = true
    
    let userDefaultsHelper = UserDefaultsHelper()
    
    func initialize() {
        isFirstLogin = userDefaultsHelper.isFirstLogin
    }
}
