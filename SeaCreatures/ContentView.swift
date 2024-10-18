//
//  ContentView.swift
//  SeaCreatures
//
//  Created by Jia Chen on 2024/10/17.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(\.openWindow) private var openWindow
    @State private var selectedCreature: SeaCreature?
    
    private var SeaCreatures = [
        SeaCreature(name: "Clam", modelName: "ClamScene"),
        SeaCreature(name: "Fish", modelName: "FishScene"),
        SeaCreature(name: "Slug", modelName: "SlugScene"),
        SeaCreature(name: "Starfish", modelName: "StarfishScene")
    ]
    
    var body: some View {
        NavigationSplitView {
            List(SeaCreatures) { creature in
                Button {
                    selectedCreature = creature
                } label: {
                    Text(creature.name)
                }

            }
            .navigationTitle("Sea Creatures")
        } detail: {
            if let selectedCreature {
                Model3D(named: selectedCreature.modelName, bundle: realityKitContentBundle)
                    .navigationTitle(selectedCreature.name)
                    .toolbar {
                        Button {
                            openWindow(id: "creatureWindow", value: selectedCreature.modelName)
                        } label: {
                            Text("View \(selectedCreature.name)")
                        }

                    }
                
            } else {
                Text("Select a sea creature")
            }
        }
        .frame(minWidth: 700, minHeight: 700)

    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
