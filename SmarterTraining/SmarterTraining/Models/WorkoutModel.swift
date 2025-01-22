//
//  WorkoutModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import Foundation

struct WorkoutModel: Codable {
    var name: String
    var created: Date
    var exercises: [ExerciseModel]
}
