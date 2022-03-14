There isn't a built-in data structure in Swift that looks like a linked list. Thankfully, it's easy to make classes that represent data structures in Swift!

Here's the code for a Node, which is a single unit in a linked list:

class Node {
    var value: Int
    var next: Node?

    init(value: Int) {
        self.value = value
    }
}
Make sure you understand this code before moving on. We use init to initialize a new Node. A Node can have a value associated with it, and it has a variable that points to the next item in the linked list. In our case, value is used to store Ints, but you can create a linked list with any type.

To create a node, we initialize it by providing a value. We can link different nodes together using the next property.

let node1 = Node(value: 1)
let node2 = Node(value: 2)
node1.next = node2
With the ability to create nodes, and to link them together, we can implement a LinkedList class in Swift. We start with a simple head node.

class LinkedList {

    var head: Node?

    init(head: Node?) {
        self.head = head
    }
}
While this looks redundant to simply linking several nodes together, implementing a LinkedList class gives us the ability to add methods that perform common linked list operations - retrieving, appending, inserting, and deleting elements. Let's start with a method that appends a node to the end of the list.

First, you need to check if the list is empty (head is nil), and if so, set the head to the new element. If this list already has elements (head is not nil), you instead iterate through the next references in every Node using a while loop. A nil value for next signals the end of the linked list. Finally, you assign the new node to the next property of the preceding node.

func append(_ node: Node) {

    guard head != nil else {
        head = node
        return
    }

    var current = head
    while let _ = current?.next {
        current = current?.next
    }
    current?.next = node
}
Again, this part is really important, so don't rush through it. Take the code line-by-line and make sure everything makes sense. Once you have a good grasp of how the append() method works, move on to the next screen where you'll implement the linked list methods for retrieving, inserting, and deleting nodes.


Retrieving a Node
Because linked lists do not have indexing like arrays, the trick to getting a node is to iterate over the linked list until we reach the node at the desired position. The first position in our list will be position 1, so we use a guard to ensure position is always greater than zero. We then create a variable to keep track of our position in the list, and another variable for the node. We then loop through the list until we either find the desired node, or until we reach the end of the list.

func getNode(atPosition position: Int) -> Node? {
    guard position > 0 else {
        return nil
    }

    var counter = 1
    var current = head

    while current != nil && counter <= position {
        if counter == position {
            return current
        }
        current = current?.next
        counter += 1
    }
    return nil
}
When current and position are equal, we know we've reached the desired node, so we return it. However, if we reach the end of the list, meaning that position is greater than the list's length, we return nil.
Insert
The logic for insert is nearly the same as getting an element, but with two main differences.

After the node for a given position has been found, the node’s next property is assigned to the next property of the node previously in that position. The previous node’s next property is assigned to the newly inserted node.

We also have to handle the case when a new node is inserted at position 1. Remember that the first node is called head, so inserting at the first position means that our new node will become the head. The old head is then assigned to the new node’s next property. The complete implementation is shown below.

func insertNode(_ node: Node, at position: Int) {
    guard position > 0 else {
        return
    }

    var counter = 1
    var current = head

    if position > 1 {
        while current != nil && counter < position {
            if counter == position - 1 {
                node.next = current?.next
                current?.next = node
                break
            }
            current = current?.next
            counter += 1
        }
    } else if position == 1 {
        node.next = head
        head = node
    }
}
We've already gone over how to address inserting at the head position. The key difference is in the while loop. Instead of returning the node, we insert it between the current node and the next node. Once it's been inserted, our work is done, and we simply break from the loop.
Delete
For deleting a node, we again locate the node using a loop. This time however, instead of searching for a node at a specific position, we’re getting the first node with the specified value. Notice how we keep track of both the previous and current nodes; this will help us in the next step. Just like before, we do all of this in a while loop, until we reach the end of the list.

func deleteNode(withValue value: Int) {
    var current = head
    var previous: Node?

    while current?.value != value && current?.next != nil {
        previous = current
        current = current?.next
    }

    if current?.value == value {
        if previous != nil {
            previous?.next = current?.next
        } else {
            head = current?.next
        }
    }
}
If we reach a node with a matching value, we then check the value of previous. If it’s not nil, we delete the node by setting the previous node’s next property to the current (the one we’re deleting) node’s next property. If previous is nil, then we know we’re deleting the head node, and we simply reassign the head to the node at position 2.
