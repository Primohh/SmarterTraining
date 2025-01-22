//
//  TrainingModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

struct ExerciseModel: Codable {
    let name: String
    let type: String
    let icon: String
    let distance: Double?
    let duration: Double?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case icon = "icon"
        case distance = "distance"
        case duration = "duration"
    }
}
