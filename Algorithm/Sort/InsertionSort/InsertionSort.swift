//
//  InsertionSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 02/03/22.
//

import Foundation

class InsertionSort {

    static func insertionSort(array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 1..<(sortedArray.count) {
            let aux = sortedArray[i]
            var position = i - 1
            while(position >= 0 && sortedArray[position] > aux) {
                sortedArray[position + 1] = sortedArray[position]
                position -= 1
            }
            sortedArray[position + 1] = aux
        }
        return sortedArray
    }

    static func recursiveInsertionSort(array: inout [Int], size: Int) {
        if size <= 1 { return }
        recursiveInsertionSort(array: &array, size: size - 1)
        let last = array[size - 1]
        var j = size - 2

        while (j >= 0 && array[j] > last) {
            array[j+1] = array[j]
            j = (j - 1)
        }
        array[j+1] = last
    }

    static func recursiveMergeInsertionSort(array: inout [Int], start: Int, end: Int) {
        if start < end {
            let middle = (start + end) / 2
            recursiveMergeInsertionSort(array: &array, start: start, end: middle)
            recursiveMergeInsertionSort(array: &array, start: middle + 1, end: end)
            mergeInsertionSort(array: &array, start: start, middle: middle, end: end)

        }
    }

    static func mergeInsertionSort(array: inout [Int], start: Int, middle: Int, end: Int) {
        var left = start
        for i in stride(from: (middle + 1), through: end, by: 1) {
            let temp = array[i]
            var shift = i
            while(shift > left && array[shift - 1] > temp) {

                array[shift] = array[shift - 1]

                shift -= 1
            }
            if (shift != i)  { array[shift] = temp }
            left = (shift + 1)
        }
    }
}
