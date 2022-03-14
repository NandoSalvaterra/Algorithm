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



    static func inoutMergeSort(array: inout [Int], startIndex: Int, endIndex: Int) {
        if startIndex >= endIndex { return }
        let middleIndex = array.count / 2
        inoutMergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
        inoutMergeSort(array: &array, startIndex: middleIndex, endIndex: endIndex)
        inoutMerge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)

    }

    static func inoutMerge(array: inout [Int], startIndex: Int, middleIndex: Int, endIndex: Int) {
        //    left = lista[inicio:meio]
        //    right = lista[meio:fim]
        //    top_left, top_right = 0, 0
        //    for k in range(inicio, fim):
        //        if top_left >= len(left):
        //            lista[k] = right[top_right]
        //            top_right = top_right + 1
        //        elif top_right >= len(right):
        //            lista[k] = left[top_left]
        //            top_left = top_left + 1
        //        elif left[top_left] < right[top_right]:
        //            lista[k] = left[top_left]
        //            top_left = top_left + 1
        //        else:
        //            lista[k] = right[top_right]
        //            top_right = top_right + 1
    }

}







//# Vídeo "Merge Sort": https://youtu.be/S5no2qT8_xg
//def mergesort(lista, inicio=0, fim=None):
//    if fim is None:
//        fim = len(lista)
//    if(fim - inicio > 1):
//        meio = (fim + inicio)//2
//        mergesort(lista, inicio, meio)
//        mergesort(lista, meio, fim)
//        merge(lista, inicio, meio, fim)
//
//def merge(lista, inicio, meio, fim):
//    left = lista[inicio:meio]
//    right = lista[meio:fim]
//    top_left, top_right = 0, 0
//    for k in range(inicio, fim):
//        if top_left >= len(left):
//            lista[k] = right[top_right]
//            top_right = top_right + 1
//        elif top_right >= len(right):
//            lista[k] = left[top_left]
//            top_left = top_left + 1
//        elif left[top_left] < right[top_right]:
//            lista[k] = left[top_left]
//            top_left = top_left + 1
//        else:
//            lista[k] = right[top_right]
//            top_right = top_right + 1
