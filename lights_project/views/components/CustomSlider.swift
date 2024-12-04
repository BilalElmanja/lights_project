//
//  CustomSlider.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import SwiftUI

/// Composant pour le slider personnalisé avec valeur affichée.
struct CustomSlider: View {
    @Binding var value: Double
    var isEnabled: Bool = true

    var body: some View {
        HStack {
            Slider(value: $value, in: 0...1)
                .disabled(!isEnabled)
                .accentColor(isEnabled ? Color.purple : Color.gray)
                .animation(.easeInOut, value: value)
            Text("\(Int(value * 100))")
                .frame(width: 40)
        }
    }
}
