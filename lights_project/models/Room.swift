//
//  Room.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation

/// Modèle représentant une pièce dans le bâtiment.
struct Room: Identifiable {
    let id: UUID
    var name: String
    var lightingState: LightingState
    var lightingLevel: Double // Valeur entre 0.0 et 1.0
    var lightingType: LightingType
    var lumens: Int
    var isOutOfOrder: Bool
}
