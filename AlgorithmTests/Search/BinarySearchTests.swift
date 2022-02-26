//
//  BinarySearchTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import XCTest
@testable import Algorithm

class BinarySearchTests: XCTestCase {

    func testRepetitiveBinarySearch() throws {
        let orderedList = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 21
        XCTAssertEqual(BinarySearch.repetitiveBinarySearch(array: orderedList, searchableValue: 41), searchedIndex)
    }

    func testOptimizedRepetitiveBinarySearch() throws {
        let orderedList = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 5
        XCTAssertEqual(BinarySearch.optimizedRepetitiveBinarySearch(array: orderedList, searchableValue: 8), searchedIndex)
    }

    func testBestOptimizedRepetitivedBinarySearch() throws {
        let orderedList = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 29
        XCTAssertEqual(BinarySearch.bestOptimizedRepetitivedBinarySearch(array: orderedList, searchableValue: 56), searchedIndex)
    }

    func testRecursiveBinarySearch() throws {
        let orderedList = [1, 2, 4, 6, 7, 8, 9, 12, 15, 17, 19, 22, 23, 25, 27, 32, 33, 36, 38,
        39, 40, 41, 42, 45, 47, 49, 51, 52, 54, 56, 58, 59, 60, 61, 64, 66, 69, 70, 72, 74, 75,
        78, 80, 81, 82, 83, 84, 86, 87, 88, 90, 91, 92, 93, 94, 98, 99, 100, 102, 104, 106, 109]
        let searchedIndex = 7
        XCTAssertEqual(BinarySearch.recursiveBinarySearch(array: orderedList, start: 0, end: (orderedList.count - 1), searchableValue: 12), searchedIndex)
    }
}
