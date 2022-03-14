//
//  MergeSortTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 11/03/22.
//

import XCTest
@testable import Algorithm

class MergeSortTests: XCTestCase {

    func testMergeSort() throws {
        let disorderedList = [7, 12, 5, 64, 1, 9, 25, 21, 6, 86, 43, 17, 44, 14, 85, 88]
        let orderedList = [1, 5, 6, 7, 9, 12, 14, 17, 21, 25, 43, 44, 64, 85, 86, 88]
        XCTAssertEqual(MergeSort.mergeSort(array: disorderedList), orderedList)
    }

}
