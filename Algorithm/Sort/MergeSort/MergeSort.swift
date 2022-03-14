//
//  MergeSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 11/03/22.
//

import Foundation

class MergeSort {

    static func mergeSort(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }

        let middleIndex = array.count / 2

        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))

        return merge(left: leftArray, right: rightArray)
    }

    static func merge(left: [Int], right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0

        var orderedArray: [Int] = []

        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]

            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }

        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }

        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        return orderedArray
    }
}
