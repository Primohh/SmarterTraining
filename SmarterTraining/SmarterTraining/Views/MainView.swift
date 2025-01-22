//
//  ContentView.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 22/01/2025.
//

import SwiftUI
import PopupView

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    @State var showWelcomeAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                
            }
        }
        .popup(isPresented: $showWelcomeAlert) {
            createWelcomePopup()
        } customize: {
            $0.type(.default)
            .position(.center)
            .animation(.spring())
            .closeOnTap(false)
            .closeOnTapOutside(true)
        }
        .padding()
        .onAppear {
            viewModel.initialize()
            showWelcomeAlert = viewModel.isFirstLogin
        }
    }
    
    @ViewBuilder
    private func createWelcomePopup() -> some View {
        GeometryReader { metrics in
            VStack(spacing: 10) {
                Text("Welcome to Smarter Training")
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .padding()
            .frame(maxWidth: metrics.size.width * 0.5)
            .background(Color.primary)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
        .padding()
    }
}

#Preview {
    MainView()
}
