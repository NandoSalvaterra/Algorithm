//
//  QuickSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 17/03/22.
//

import Foundation

class QuickSort {
    
   func quickSort(array: inout [Int], begin: Int, end: Int) {
        if begin < end {
            let pivot = hoarePartition(array: &array, begin: begin, end: end)
            quickSort(array: &array, begin: begin, end: pivot - 1)
            quickSort(array: &array, begin: pivot + 1, end: end  )
        }
    }
    
    static func hoarePartition(array: inout [Int], begin: Int, end: Int) -> Int {
        var i = begin
        var j = end
        
        var position = Int.random(in: begin...end)
        let pivot = array[position]
        
        repeat {
            while (array[i] < pivot) { i += 1 }
            while (array[j] > pivot) { j -= 1 }
            
            if (i <= j) {
                if (i != j) {
                    array.swapAt(i, j)
                    if (i == position) { position = j }
                    else if (j == position) {  position = i }
                }
                i += 1
                j -= 1
            }
        } while (i <= j)
        if (i < position) {
            array.swapAt(i, position)
            position = i
        } else if (position < j) {
            array.swapAt(j, position)
            position = j
        }
        return position
    }
    
    static func lomutoPartition(array: inout [Int], begin: Int, end: Int) -> Int {
        let pivot = array[begin]
        var position = begin
        
        for i in stride(from: begin + 1, through: end, by: 1) {
            if (array[i] < pivot) {
                position += 1
                if (i != position) { array.swapAt(i, position) }
            }
        }
        array.swapAt(begin, position)
        return position
    }
    
    static func lomutoPartitionVariation(array: inout [Int], begin: Int, end: Int) -> Int {
        let pivot = array[end]
        var i = begin
        
        for j in begin..<end {
            if array[j] <= pivot {
                (array[i], array[j]) = (array[j], array[i])
                i += 1
            }
        }
        (array[i], array[end]) = (array[end], array[i])
        return i
    }
    
    static func medianOfThreePartition(array: inout [Int], begin: Int, end: Int) -> Int {
        let n = end - begin + 1
        
        if (n == 2) {
            if (array[begin] > array[end]) { array.swapAt(begin, end) }
            return begin
        }
        
        var position = (begin + end) / 2
        
        if (array[begin] > array[position]) { array.swapAt(begin, position) }
        if (array[begin] > array[end]) { array.swapAt(begin, end) }
        if (array[position] > array[end]) { array.swapAt(position, end) }
        if (n == 3) { return position }
        
        var i = begin + 1
        var j = end - 1
        
        while (i < j) {
            while(i < position) {  if (array[i] > array[position]) { break } else { i += 1 }}
            while(j > position) {  if (array[j] < array[position]) { break } else { j -= 1 }}
            
            if (i != position && j != position) {
                array.swapAt(i, j)
            } else if (i == position && j != position) {
                array.swapAt(position, j)
                position += 1
                array.swapAt(position, j)
                i = position
            } else if (i != position && j == position) {
                array.swapAt(position, i)
                position -= 1
                array.swapAt(position, i)
                j = position
            }
        }
        return position
    }
    
    static func medianOfThreePartitionv2(array: inout [Int], begin: Int, end: Int) -> Int {
        let n = end - begin + 1
        
        if (n == 2) {
            if (array[begin] > array[end]) { array.swapAt(begin, end) }
            return begin
        }
        
        var position = (begin + end) / 2
        if (array[begin] > array[position]) { array.swapAt(begin, position) }
        if (array[begin] > array[end]) { array.swapAt(begin, end) }
        if (array[position] > array[end]) { array.swapAt(position, end) }
        if (n == 3) { return position }
        
        var i = begin
        var j = end - 1
        
        array.swapAt(position, j)
        position = j
        
        while (true) {
            repeat { i += 1 } while(array[i] < array[position])
            repeat { j -= 1 } while(array[j] > array[position])
            if (i < j) { array.swapAt(i, j) } else { break }
        }
        
        position = i
        array.swapAt(position, (end - 1))
        return position
    }
}
