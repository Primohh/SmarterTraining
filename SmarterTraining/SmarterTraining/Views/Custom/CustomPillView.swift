//
//  CustomPillView.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import SwiftUI

struct CustomPillView: View {
    var name: String
    var created: Date
    
    let dateFormatter = DateFormatter()
    
    let onClick: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "figure.run")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color(UIColor(named: "ButtonColor")!))
                    .frame(height: 110, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text(name)
                        .foregroundStyle(Color(UIColor(named: "TextColor")!))
                        .font(.title2)
                        .padding()
                    
                    Text(getCreatedText(created))
                        .foregroundStyle(Color(.systemGray))
                        .font(.title3)
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(Color(UIColor(named: "Primary")!))
            .cornerRadius(15)
            .shadow(radius: 5)
            .onTapGesture {
                onClick()
            }
        }
        .padding(8)
    }
    
    func getCreatedText(_ date: Date) -> String {
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
