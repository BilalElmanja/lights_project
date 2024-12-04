//
//  LightingState.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation

/// Représente l'état de l'éclairage d'une pièce.

enum LightingState: String, CaseIterable, Identifiable {
    case on = "On"
    case off = "Off"

    var id: String { self.rawValue }
}
