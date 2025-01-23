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
    @StateObject var settingsViewModel = SettingsViewModel()
    @StateObject var workoutViewModel = WorkoutsViewModel()
    
    @State var showWelcomeAlert = false
    @State var selectedTab: Int = 0
    @State var prevSelectedTab: Int = 0

    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if(selectedTab == 0) {
                    WorkoutsView(viewModel: workoutViewModel)
                }
                else if(selectedTab == 1) {
                    SettingsView(viewModel: settingsViewModel)
                }
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 90)
            
            CustomTabBar(selectedTab: $selectedTab, prevSelectedTab: $prevSelectedTab)
        }
        .ignoresSafeArea(edges: [.bottom])
        .popup(isPresented: $showWelcomeAlert) {
            createWelcomePopup()
        } customize: {
            $0.type(.default)
            .position(.center)
            .animation(.snappy())
            .closeOnTap(false)
            .closeOnTapOutside(true)
        }
        .onAppear {
            viewModel.initialize()
            showWelcomeAlert = viewModel.isFirstLogin
        }
    }
    
    @ViewBuilder
    private func createWelcomePopup() -> some View {
        VStack() {
            Text("Velkommen til Smarter Training!")
                .foregroundStyle(Color(UIColor(named: "TextColor")!))
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(10)
                .padding(.top, 15)
            
            Text("Med Smarter Training kan du selv sammensætte dine træningsprogrammer - præcis som du vil have dem. Vi har også lavet nogle for dig på forhånd")
                .foregroundStyle(Color(UIColor(named: "TextColor")!))
                .font(.body)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(5)
            
            Divider()
                .frame(width: nil, height: 2, alignment: .center)
                .background(Color(.systemGray5))
            
            Button("Lad os komme i gang", role: .cancel) {
                viewModel.isFirstLogin = false
                showWelcomeAlert = false
            }
            .padding(12)
            .padding(.bottom, 15)
            .foregroundStyle(Color(UIColor(named: "ButtonColor")!))
            .fontWeight(.semibold)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
        .background(Color(UIColor(named: "Primary")!))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    MainView()
}
