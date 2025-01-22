//
//  UserDefaultsHelper.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

class UserDefaultsHelper {
    var isFirstLogin: Bool {
        get {
            let isFirstLogin = UserDefaults.standard.object(forKey: "isFirstLogin")
            
            if(isFirstLogin == nil) {
                return true
            }
            else {
                return isFirstLogin as? Bool ?? true
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isFirstLogin")
        }
    }
}
