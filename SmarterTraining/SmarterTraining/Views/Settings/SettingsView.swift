//
//  SettingsView.swift
//  SmarterTraining
//
//  Created by Mikkel Primdahl on 23/01/2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    @State var showResetPopup: Bool = false
    
    var body: some View {
        ScrollView {
            Text("Har du et Apple Watch? Så kan du finde appen på dit ur. Her vil du kunne starte dine træningsprogrammer, følge med, stoppe og pause, direkte på dit ur.")
                .font(.subheadline)
                .padding()
            
            Spacer()
            
            Button(role: .destructive, action: {
                showResetPopup = true
            }) {
                Text("Nulstil app")
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(Color(UIColor(named: "Primary")!))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor(named: "Primary")!), lineWidth: 2)
                    )
            }
            .cornerRadius(10)
            .padding()

            Text("Appen er under udvikling og er derfor ikke færdigudviklet. På nuværende tidspunkt holdes alt data lokalt på din enhed. Hvis du sletter appen, vil det derfor nulstilles.")
                .font(.subheadline)
                .foregroundStyle(Color(.systemGray))
                .padding()
        }
        .alert("Nulstil app?", isPresented: $showResetPopup) {
            Button("Annullér", role: .cancel) {
                showResetPopup = false
            }
            
            Button("Nulstil", role: .destructive) {
                let appReset = viewModel.resetApp()
                
                if(!appReset) {
                    //Show error message
                }
                
                showResetPopup = false
            }
        }
        message: {
            Text("Er du sikker på at du vil nulstille appen? Dette vil slette alle dine gemte træninger, og kan ikke fortrydes.")
        }
    }
}
