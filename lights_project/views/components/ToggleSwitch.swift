//
//  ToggleSwitch.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import SwiftUI

/// Composant pour le toggle switch personnalisé.
struct ToggleSwitch: View {
    @Binding var selection: LightingState

    var body: some View {
        HStack {
            Button(action: {
                selection = .off
            }) {
                HStack {
                    Image(systemName: "lightbulb.slash")
                    Text("Off")
                }
                .padding()
                .background(selection == .off ? Color.purple.opacity(0.2) : Color.gray.opacity(0.2))
                .cornerRadius(8)
            }

            Button(action: {
                selection = .on
            }) {
                HStack {
                    Image(systemName: "lightbulb")
                    Text("On")
                }
                .padding()
                .background(selection == .on ? Color.purple.opacity(0.2) : Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
        }
        .foregroundColor(.primary)
    }
}
