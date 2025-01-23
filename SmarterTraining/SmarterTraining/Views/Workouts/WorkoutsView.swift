//
//  ExercisesView.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import SwiftUI

struct WorkoutsView: View {
    @StateObject var viewModel: WorkoutsViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.workouts, id: \.created) { workout in
                CustomPillView(name: workout.name, created: workout.created, onClick: {
                    //Navigate to workout view
                    print("Workout clicked")
                })
            }
        }
        .onAppear {
            viewModel.getWorkouts()
        }
        .navigationTitle("Dine træningsprogrammer")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}
