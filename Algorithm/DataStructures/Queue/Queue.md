Let's look at implementing queues in Swift. While Swift does not come with a default implementation of a queue, it’s easy to write one that uses an array! You could also implement a queue using a linked list, like we did for stacks, but we’ll leave that as a challenge for you to figure out on your own.
Queues Practice
Make a Queue class using an array! Hint: You can use any Swift array method you'd like. Try to implement each method in as few lines as possible and use the test cases as a guide.


import Foundation

class Queue {
    
    var storage: [Int]
    
    init(head: Int) {
        storage = [head]
    }
    
    // add the element to the queue
    func enqueue(_ element: Int) {
        
    }
    
    // return the next element to be dequeued from the queue
    // if the queue is empty, return nil
    func peek() -> Int? {
        return nil
    }
    
    // remove and return the next element to be dequeued
    func dequeue() -> Int? {
        return nil
    }
}

// Test cases
/*
// Setup
let q = Queue(head: 1)
q.enqueue(2)
q.enqueue(3)

// Test peek
print(q.peek()!) // Should be 1

// Test dequeue
print(q.dequeue()!) // Should be 1
 
// Test enqueue
q.enqueue(4)
print(q.dequeue()!) // Should be 2
print(q.dequeue()!) // Should be 3
print(q.dequeue()!) // Should be 4
q.enqueue(5)
print(q.peek()!) // Should be 5
*/




While not as performant as implementing a queue with a linked list, using an array is a great way to understand this data structure. Let’s break down the implementation for each method.
Enqueue
Enqueueing an element is just like adding to an array. To add an element to the end of the storage array, we call the append() method.

func enqueue(_ element: Int) {
    storage.append(element)
}
Peek
Queues are a first-in first-out data structure, so while we add elements to the end of the array, the next element to be dequeued comes at the beginning of the array, or at index 0.

func peek() -> Int? {
    return storage[0]
}
Here, all we're doing is getting the first element and returning it.
Dequeue
In addition to returning the first element, dequeue() also removes the first element in the array, at index 0. Luckily, the built-in remove(at:) method does just what we need.

func dequeue() -> Int? {
    return storage.remove(at: 0)
}
While we could implement a more performant queue using a linked list, like we did for stacks, Swift's arrays are designed to work well with queue functionality, and we only need a single line of code to implement each queue operation.