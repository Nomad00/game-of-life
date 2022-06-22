//
//  CellTests.swift
//  GameOfLifeTests
//
//  Created by Michael Stanziano on 6/21/22.
//

import XCTest
@testable import GameOfLife

final class CellTests: XCTestCase {
    func testNeighborDetermination_Horizontal() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 2, y: 1)
        
        XCTAssertTrue(
            firstCell.isNeighbor(to: secondCell),
            "Cells adjacent in `x` axis should be neighbors."
        )
    }
    
    func testNeighborDetermination_Vertical() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 1, y: 2)
        
        XCTAssertTrue(
            firstCell.isNeighbor(to: secondCell),
            "Cells adjacent in `y` axis should be neighbors."
        )
    }
    
    func testNeighborDetermination_Diagonal() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 2, y: 2)
        
        XCTAssertTrue(
            firstCell.isNeighbor(to: secondCell),
            "Cells diagonally adjacent should be neighbors."
        )
    }
    
    func testNeighborDetermination_NowhereNearEachOtherByX() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 3, y: 1)
        
        XCTAssertFalse(
            firstCell.isNeighbor(to: secondCell),
            "Cells > 1 `x` apart should not be neighbors."
        )
    }
    
    func testNeighborDetermination_NowhereNearEachOtherByY() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 1, y: 3)
        
        XCTAssertFalse(
            firstCell.isNeighbor(to: secondCell),
            "Cells > 1 `y` apart should not be neighbors."
        )
    }
    
    func testNeighborDetermination_SameLocation() throws {
        let firstCell = Cell(x: 1, y: 1)
        let secondCell = Cell(x: 1, y: 1)
        
        XCTAssertFalse(
            firstCell.isNeighbor(to: secondCell),
            "You can't be your own neighbor."
        )
    }
}
