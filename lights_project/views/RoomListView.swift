import SwiftUI

/// Vue principale affichant la liste des pièces.
struct RoomListView: View {
    @StateObject var viewModel = RoomListViewModel(roomService: RoomService())

    var body: some View {
        NavigationView {
            VStack {
                // En-tête avec le titre et le toggle switch.
                VStack(alignment: .leading) {
                    Text("Lights")
                        .font(.largeTitle)
                        .bold()
                    HStack {
                        Text("All rooms")
                            .font(.headline)
                        Spacer()
                        ToggleSwitch(selection: $viewModel.toggleState)
                            .onChange(of: viewModel.toggleState) { _ in
                                viewModel.toggleAllLights()
                            }
                    }
                }
                .padding()

                // Liste des pièces.
                List {
                    ForEach(viewModel.rooms) { roomViewModel in
                        RoomRowView(viewModel: roomViewModel)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}
