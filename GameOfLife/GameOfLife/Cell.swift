//
//  Cell.swift
//  GameOfLife
//
//  Created by Michael Stanziano on 6/21/22.
//

import Foundation

struct Cell: Equatable {
    enum State {
        case alive
        case dead
    }

    let x: Int
    let y: Int
    var state: State = .dead // TODO: Is it safe to default this?
}

extension Cell {
    func isNeighbor(to cell: Cell) -> Bool {
        
        let xDelta = abs(self.x - cell.x)
        let yDelta = abs(self.y - cell.y)
        
        switch (xDelta, yDelta) {
        case (1, 1), (0, 1), (1, 0):
            return true
        default:
            return false
        }
        
    }
}
