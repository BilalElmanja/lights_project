//
//  RoomService.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation
import Combine

/// Service gérant les données des pièces.
class RoomService: ObservableObject {
    @Published var rooms: [Room] = [
        // Données initiales
        Room(id: UUID(), name: "Entrance", lightingState: .on, lightingLevel: 0.5, lightingType: .led, lumens: 2500, isOutOfOrder: false),
        Room(id: UUID(), name: "Office 1", lightingState: .on, lightingLevel: 1.0, lightingType: .halogen, lumens: 3000, isOutOfOrder: false),
        Room(id: UUID(), name: "Office 2", lightingState: .off, lightingLevel: 0.0, lightingType: .led, lumens: 2000, isOutOfOrder: false),
        Room(id: UUID(), name: "Supply room", lightingState: .off, lightingLevel: 0.0, lightingType: .halogen, lumens: 0, isOutOfOrder: false)
    ]
    
    /// Allume ou éteint toutes les lumières.
    func toggleAllLights(state: LightingState) {
        for index in rooms.indices {
            // Mise à jour de l'état de l'éclairage
            rooms[index].lightingState = state
            // Mise à jour du niveau d'éclairage
            rooms[index].lightingLevel = state == .on ? 1.0 : 0.0
        }
    }
    
    /// Met à jour une pièce spécifique.
    func updateRoom(_ room: Room) {
        if let index = rooms.firstIndex(where: { $0.id == room.id }) {
            // Mise à jour de la pièce
            rooms[index] = room
        }
    }
}
