//
//  TernarySearchTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import XCTest
@testable import Algorithm

class TernarySearchTests: XCTestCase {

    func testTernarySearch() throws {
        let orderedArray = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 7
        XCTAssertEqual(TernarySearch.ternarySearch(array: orderedArray, searchableValue: 12), searchedIndex)
    }

    func testOptimizedTernarySearch() throws {
        let orderedArray = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 7
        XCTAssertEqual(TernarySearch.optimizedTernarySearch(array: orderedArray, searchableValue: 12), searchedIndex)
    }

    func testRecursiveTernarySearch() throws {
        let orderedArray = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 7
        XCTAssertEqual(TernarySearch.recursiveTernarySearch(array: orderedArray, start: 0, end: (orderedArray.count - 1), searchableValue: 12), searchedIndex)
    }
}
