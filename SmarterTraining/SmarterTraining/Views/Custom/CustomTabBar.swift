//
//  CustomTabBar.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import SwiftUI
import AnimatedTabBar

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    @Binding var prevSelectedTab: Int
    
    var body: some View {
        ZStack {
            AnimatedTabBar(selectedIndex: $selectedTab, prevSelectedIndex: $prevSelectedTab) {
                customTabButton(index: 0, image: Image(systemName: "figure.run"), title: "Træningsprogrammer")
                customTabButton(index: 1, image: Image(systemName: "gearshape"), title: "Indstillinger")
            }
            .cornerRadius(16)
            .barColor(Color(UIColor(named: "Primary")!))
            .selectedColor(Color(UIColor(named: "ButtonColor")!))
            .unselectedColor(Color(UIColor(named: "TextColor")!))
            .ballColor(Color(UIColor(named: "ButtonColor")!))
            .verticalPadding(20)
            .ballTrajectory(.parabolic)
            .ballAnimation(.interpolatingSpring(stiffness: 130, damping: 15))
            .indentAnimation(.easeOut(duration: 0.3))
            .shadow(radius: 2)
        }
        .background(Color.clear)
    }
    
    func customTabButton(index: Int, image: Image, title: String) -> some View {
        Button(action: {
            withAnimation(.interpolatingSpring(stiffness: 130, damping: 15)) {
                prevSelectedTab = selectedTab
                selectedTab = index
            }
        }) {
            VStack {
                image
                    .foregroundStyle(selectedTab == index ? Color(UIColor(named: "ButtonColor")!) : Color(UIColor(named: "TextColor")!))
                    .scaleEffect(selectedTab == index ? 1.15 : 1)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: selectedTab)
                
                Text(title)
                    .font(.caption)
                    .bold()
                    .foregroundStyle(selectedTab == index ? Color(UIColor(named: "ButtonColor")!) : Color(UIColor(named: "TextColor")!))
                    .scaleEffect(selectedTab == index ? 1.15 : 1)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: selectedTab)
            }
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity)
        }
    }
}
