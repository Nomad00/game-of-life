//
//  WorldTests.swift
//  GameOfLifeTests
//
//  Created by Michael Stanziano on 6/21/22.
//

import XCTest
@testable import GameOfLife

final class WorldTests: XCTestCase {
    static var seedCells: [Cell] = [
        Cell(x: 0, y: 0, state: .dead),
        Cell(x: 0, y: 1, state: .alive),
        Cell(x: 0, y: 2, state: .alive),
        Cell(x: 0, y: 3, state: .dead),
        Cell(x: 1, y: 0, state: .dead),
        Cell(x: 1, y: 1, state: .alive),
        Cell(x: 1, y: 2, state: .dead),
        Cell(x: 1, y: 3, state: .alive),
        Cell(x: 2, y: 0, state: .dead),
        Cell(x: 2, y: 1, state: .alive),
        Cell(x: 2, y: 2, state: .dead),
        Cell(x: 2, y: 3, state: .alive),
        Cell(x: 3, y: 0, state: .dead),
        Cell(x: 3, y: 1, state: .alive),
        Cell(x: 3, y: 2, state: .dead),
        Cell(x: 3, y: 3, state: .alive),
    ]
    
    func testWorld_RandomCells() {
        let options = XCTExpectedFailure.Options()
        options.isStrict = false
        XCTExpectFailure(
            "There is a tiny chance that the randomly generated `World` will match `seedCells`, don't block on that.",
            options: options
        )
        
        let world = World(size: 3)
        
        XCTAssertNotEqual(
            Self.seedCells,
            world.cells,
            "`World` should be random when `cells` are not provided."
        )
    }

    func testWorld_SpecifiedCells() {
        let world = World(size: 3, cells: Self.seedCells)
        
        XCTAssertEqual(
            Self.seedCells,
            world.cells,
            "`World` should use specified `cells` when provided."
        )
    }
}
