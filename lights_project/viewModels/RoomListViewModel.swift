//
//  RoomListViewModel.swift
//  lights_project
//
//  Created by EL MANJA BILAL on 04/12/2024.
//


import Foundation
import Combine

/// ViewModel pour la liste des pièces.
class RoomListViewModel: ObservableObject {
    @Published var rooms: [RoomViewModel] = []
    @Published var toggleState: LightingState = .off

    private var roomService: RoomService
    private var cancellables = Set<AnyCancellable>()

    init(roomService: RoomService) {
        self.roomService = roomService
        self.rooms = roomService.rooms.map { RoomViewModel(room: $0, roomService: roomService) }
        
        // Observateur pour mettre à jour les rooms lorsqu'il y a des changements.
        roomService.$rooms
            .map { rooms in
                rooms.map { RoomViewModel(room: $0, roomService: roomService) }
            }
            .assign(to: \.rooms, on: self)
            .store(in: &cancellables)
    }
    
    /// Action pour allumer ou éteindre toutes les lumières.
    func toggleAllLights() {
        roomService.toggleAllLights(state: toggleState)
    }
}
