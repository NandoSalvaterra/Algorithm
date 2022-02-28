//
//  MaxMinSelectionTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import XCTest
@testable import Algorithm

class MaxMinSelectionTests: XCTestCase {

    func testMaxSelection() throws {
        let disorderedList = [7, 12, 5, 64, 1, 9, 25, 21, 6, 86, 43, 17, 12, 44, 14, 85, 88]
        let highestValue = 88
        XCTAssertEqual(MaxMinSelection.maxSelect(array: disorderedList), highestValue)
    }

    func testMinSelection() throws {
        let disorderedList = [7, 12, 5, 64, 1, 9, 25, 21, 6, 86, 43, 17, 12, 44, 14, 85, 88]
        let lowestValue = 1
        XCTAssertEqual(MaxMinSelection.minSelect(array: disorderedList), lowestValue)
    }

    // TODO - minMaxSelectionTest 
}
