//
//  MainViewModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

class MainViewModel: ObservableObject {
    let userDefaultsHelper = UserDefaultsHelper()
    
    @Published var isFirstLogin: Bool = true {
        didSet {
            userDefaultsHelper.isFirstLogin = isFirstLogin
        }
    }
    
    
    func initialize() {
        isFirstLogin = userDefaultsHelper.isFirstLogin
    }
}
