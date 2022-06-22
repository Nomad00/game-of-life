//
//  World.swift
//  GameOfLife
//
//  Created by Michael Stanziano on 6/21/22.
//

import Foundation

struct World {
    var cells: [Cell]
    /// - note: This world is always a square.
    var size: Int

    /**
     Creates a `World` as a square grid with `size` by `size`.
     - note: Will use predefined `[cells]`, if provided.
     - note: Defaults to 10x10 grid.
     */
    init(size: Int = 10, cells: [Cell]? = nil) {
        self.size = size

        if let cells {
            self.cells = cells
        } else {
            self.cells = Self.randomCells(for: size)
        }
    }
    
    private static func randomCells(for size: Int) -> [Cell] {
        var randomCells = [Cell]()
        for x in 0..<size {
            for y in 0..<size {
                /// This will result in approximately 1/3 of the cells being `.alive`.
                let randomState = arc4random_uniform(3)
                let cell = Cell(x: x, y: y, state: randomState == 0 ? .alive : .dead)
                randomCells.append(cell)
            }
        }
        return randomCells
    }
    
    mutating func updateCells() {
        var updatedCells = [Cell]()
        let liveCells = cells.filter { $0.state == .alive }

        for cell in cells {
            let livingNeighbors = liveCells.filter { $0.isNeighbor(to: cell) }
            switch livingNeighbors.count {
            case 2...3 where cell.state == .alive:
                updatedCells.append(cell)
            case 3 where cell.state == .dead:
                let liveCell = Cell(x: cell.x, y: cell.y, state: .alive)
                updatedCells.append(liveCell)
            default:
                let deadCell = Cell(x: cell.x, y: cell.y, state: .dead)
                updatedCells.append(deadCell)
            }
        }

        cells = updatedCells
    }
}
