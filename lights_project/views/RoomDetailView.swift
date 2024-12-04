//
//  RoomDetailView.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import SwiftUI

/// Vue détaillée pour configurer une pièce spécifique.
struct RoomDetailView: View {
    @ObservedObject var viewModel: RoomViewModel

    var body: some View {
        Form {
            Section(header: Text("Intensity")) {
                // Slider pour ajuster l'intensité lumineuse.
                CustomSlider(value: Binding(
                    get: { viewModel.room.lightingLevel },
                    set: { newValue in
                        viewModel.room.lightingLevel = newValue
                        viewModel.room.lightingState = newValue > 0 ? .on : .off
                        viewModel.updateRoom()
                    }
                ))
            }
            
            Section(header: Text("Light bulb type")) {
                // Menu pour sélectionner le type d'ampoule.
                Picker("Type", selection: $viewModel.room.lightingType) {
                    ForEach(LightingType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: viewModel.room.lightingType) { _ in
                    viewModel.updateRoom()
                }
            }
            
            Section(header: Text("Light lumens")) {
                // Champ de texte pour modifier la puissance lumineuse.
                TextField("Lumens", value: $viewModel.room.lumens, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .onChange(of: viewModel.room.lumens) { _ in
                        viewModel.updateRoom()
                    }
            }
            
            Section {
                // Case à cocher pour l'état hors service.
                Toggle("Out of order", isOn: $viewModel.room.isOutOfOrder)
                    .onChange(of: viewModel.room.isOutOfOrder) { _ in
                        viewModel.updateRoom()
                    }
            }
            
            // Bouton pour copier les informations dans le presse-papiers.
            Button(action: {
                copyToClipboard()
            }) {
                Text("Copy to clipboard")
            }
        }
        .navigationTitle(viewModel.name)
    }
    
    /// Copie les informations de la pièce dans le presse-papiers.
    func copyToClipboard() {
        let info = """
        Room: \(viewModel.name)
        Intensity: \(Int(viewModel.lightingLevel * 100))
        Type: \(viewModel.lightingType.rawValue)
        Lumens: \(viewModel.lumens)
        Out of order: \(viewModel.isOutOfOrder ? "Yes" : "No")
        """
        UIPasteboard.general.string = info
    }
}


