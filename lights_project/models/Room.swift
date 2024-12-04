//
//  Room.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation

/// Modèle représentant une pièce dans le bâtiment.
// 
struct Room: Identifiable {
    let id: UUID
    // Nom de la pièce
    var name: String
    // État de l'éclairage de la pièce
    var lightingState: LightingState
    var lightingLevel: Double // Valeur entre 0.0 et 1.0
    // Type d'ampoule utilisée dans la pièce
    var lightingType: LightingType
    // Nombre de lumens de l'ampoule
    var lumens: Int
    // Température de couleur de l'ampoule
    var isOutOfOrder: Bool
}
