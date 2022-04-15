//
//  QuickSortTests.swift
//  AlgorithmTests
//
//  Created by Luiz Fernando Salvaterra on 17/03/22.
//

import XCTest
@testable import Algorithm

class QuickSortTests: XCTestCase {

    func testQuickSort() throws {
        var disorderedList = [7, 12, 5, 64, 1, 9, 25, 21, 6, 86, 43, 17, 44, 14, 85, 88]
        let orderedList = [1, 5, 6, 7, 9, 12, 14, 17, 21, 25, 43, 44, 64, 85, 86, 88]
        QuickSort.teste(array: &disorderedList, begin: 0, end: disorderedList.count - 1)
        XCTAssertEqual(disorderedList, orderedList)
    }

}
