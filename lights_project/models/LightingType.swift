//
//  LightingType.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation

/// Représente le type d'ampoule utilisée dans une pièce.
enum LightingType: String, CaseIterable, Identifiable {
    case led = "LED"
    case halogen = "Halogen"

    var id: String { self.rawValue }
}
