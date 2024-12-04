//
//  RoomViewModel.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//

import Foundation

/// ViewModel pour une pièce spécifique.
class RoomViewModel: ObservableObject, Identifiable {
    @Published var room: Room
    private var roomService: RoomService

    init(room: Room, roomService: RoomService) {
        self.room = room
        self.roomService = roomService
    }

    var id: UUID {
        room.id
    }
    
    /// Met à jour la pièce dans le service.
    func updateRoom() {
        roomService.updateRoom(room)
    }
    
    // Propriétés calculées pour faciliter l'accès depuis les vues.
    var name: String {
        room.name
    }
    
    // Propriétés calculées pour faciliter l'accès depuis les vues.
    var lightingState: LightingState {
        room.lightingState
    }
    
    // niveau d'éclairage de la pièce 
    var lightingLevel: Double {
        room.lightingLevel
    }
    
    // Type d'ampoule utilisée dans la pièce
    var lightingType: LightingType {
        room.lightingType
    }
    
    // Nombre de lumens de l'ampoule
    var lumens: Int {
        room.lumens
    }
    
    var isOutOfOrder: Bool {
        room.isOutOfOrder
    }
}
