//
//  SequentialSearchTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import XCTest
@testable import Algorithm

class SequentialSearchTests: XCTestCase {

    func testDisorderedSequentialSearch() throws {
        let disorderedList = [7, 12, 5, 64, 1, 9, 25, 21, 6, 86, 43, 17, 44, 14, 85, 88]
        let searchedIndex = 5
        XCTAssertEqual(SequentialSearch.disorderedSequentialSearch(array: disorderedList, searchableValue: 9), searchedIndex)
    }

    func testOrderedSequentialSearch() throws {
        let orderedList = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36]
        let searchedIndex = 7
        XCTAssertEqual(SequentialSearch.orderedSequentialSearch(array: orderedList, searchableValue: 12), searchedIndex)
    }
}
