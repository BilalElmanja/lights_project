//
//  RoomRowView.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import SwiftUI

/// Vue représentant une ligne pour une pièce dans la liste.
struct RoomRowView: View {
    @ObservedObject var viewModel: RoomViewModel

    var body: some View {
        HStack {
            // Icône de l'ampoule.
            Image(systemName: viewModel.lightingLevel > 0 ? "lightbulb.fill" : "lightbulb")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(viewModel.lightingLevel > 0 ? .yellow : .gray)
                .animation(.easeInOut, value: viewModel.lightingLevel)
            
            // Nom de la pièce.
            Text(viewModel.name)
                .font(.headline)
            
            Spacer()
            
            // Slider pour l'intensité lumineuse.
            CustomSlider(value: Binding(
                get: { viewModel.room.lightingLevel },
                set: { newValue in
                    viewModel.room.lightingLevel = newValue
                    viewModel.room.lightingState = newValue > 0 ? .on : .off
                    viewModel.updateRoom()
                }
            ), isEnabled: !viewModel.isOutOfOrder)
            .frame(width: 150)
            
            // Icône des paramètres (toujours fonctionnelle).
            NavigationLink(destination: RoomDetailView(viewModel: viewModel)) {
                Image(systemName: "gearshape")
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 5)
        // Le slider est désactivé si 'out of order', mais la ligne reste interactive pour accéder aux réglages.
        .opacity(viewModel.isOutOfOrder ? 0.5 : 1.0)
    }
}
