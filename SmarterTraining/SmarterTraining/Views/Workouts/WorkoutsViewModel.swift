//
//  ExercisesViewModel.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import Foundation

class WorkoutsViewModel: ObservableObject {
    
    @Published var workouts = [WorkoutModel]()
    
    func getWorkouts() {
        workouts = [
            .init(name: "Hyrox1", created: Date(), exercises: [
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil),
                .init(name: "Armbøjninger", type: "exercise", icon: "figure.strengthtraining.functional", distance: nil, duration: 120.0),
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil)
            ], lastUsed: nil, isPremium: false, isUnlocked: true),
            .init(name: "Hyrox2", created: Date(), exercises: [
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil),
                .init(name: "Armbøjninger", type: "exercise", icon: "figure.strengthtraining.functional", distance: nil, duration: 120.0),
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil)
            ], lastUsed: Date().addingTimeInterval(-60*60*24), isPremium: false, isUnlocked: true),
            .init(name: "Hyrox3", created: Date(), exercises: [
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil),
                .init(name: "Armbøjninger", type: "exercise", icon: "figure.strengthtraining.functional", distance: nil, duration: 120.0),
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil)
            ], lastUsed: Date(), isPremium: true, isUnlocked: true),
            .init(name: "Hyrox4", created: Date(), exercises: [
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil),
                .init(name: "Armbøjninger", type: "exercise", icon: "figure.strengthtraining.functional", distance: nil, duration: 120.0),
                .init(name: "Løb", type: "run", icon: "figure.run", distance: 1.0, duration: nil)
            ], lastUsed: nil, isPremium: true, isUnlocked: false)
        ].sorted(by: {
            if($0.lastUsed == nil) {
                return false
            }
            else if($1.lastUsed == nil) {
                return true
            }
            else {
                return $0.lastUsed! > $1.lastUsed!
            }
        })
    }
}
