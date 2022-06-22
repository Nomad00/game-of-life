//
//  WorldView.swift
//  GameOfLife
//
//  Created by Michael Stanziano on 6/21/22.
//

import SwiftUI

struct WorldView: View {
    @State
    var world: World
    @State
    var cellSize = 35 // A nice default for iPhone 13.
    
    @State
    var isAutoplaying: Bool = false
    @State
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            Canvas { context, size in
                for cell in world.cells {
                    let rect = CGRect(
                        x: cell.x * cellSize,
                        y: cell.y * cellSize,
                        width: cellSize,
                        height: cellSize
                    )
                    let color = cell.state == .alive ? Color.green : Color.white
                    
                    context.fill(
                        Path(rect),
                        with: .color(color)
                    )
                }
            }
            .padding()
            .navigationTitle("Game of Life")
            .navigationBarTitleDisplayMode(.inline)
            .onReceive(timer) { time in
                guard isAutoplaying else { return }
                print("updating the world")
                world.updateCells()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            defer {
                                isAutoplaying.toggle()
                            }
                            
                            if isAutoplaying {
                                timer.upstream.connect().cancel()
                            } else {
                                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            }
                        }) {
                            Label {
                                isAutoplaying ? Text("Pause") : Text("Auto-play")
                            } icon: {
                                isAutoplaying ? Image(systemName: "pause") : Image(systemName: "play")
                            }
                            
                        }
                }
                
                ToolbarItem(placement: .navigation) {
                    Button(
                        action: {
                            world.updateCells()
                        }) {
                            Label {
                                Text("Step")
                            } icon: {
                                Image(systemName: "forward")
                            }
                            
                        }
                        .disabled(isAutoplaying)
                }

                ToolbarItem(placement: .automatic) {
                    Button(
                        action: {
                            // Generate a whole new world.
                            world = World(size: world.size)
                        }) {
                            Label {
                                Text("Reset")
                            } icon: {
                                Image(systemName: "arrow.clockwise")
                            }
                            
                        }
                }
            }
        }
    }
}

private extension Cell {
    var color: Color {
        state == .alive ? Color.green : Color.white
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView(world: .init())
    }
}
