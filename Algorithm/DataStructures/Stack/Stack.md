While many built-in Apple frameworks use the stack data structure, for example the view controller hierarchy in iOS, Swift does not have a built-in implementation of a stack.

Let's make our own Stack class to see how one really works under the hood.
Stacks Practice
We’ve added the completed linked list code below. If you scroll down to the bottom of the code, you’ll see we’ve also defined a Stack class with two methods, push() and pop(). Your task is to implement these methods to get the stack working.

push(): Adds a node to the beginning of the linked list (ll)
pop(): deletes the node at the beginning of the linked list (ll), and returns the deleted node
Use the test cases to guide you when implementing these methods. Hint: When implementing push() and pop(), you can use the methods we previously defined for the LinkedList.



Again, there are many ways to solve these problems. Let's walk through some example implementations.
Push
Because inserting and deleting nodes from the beginning of the list runs in constant time O(1), whereas inserting and deleting from the end of the list runs in linear time O(n), we’ll use the former approach. We already have a method to insert at the first position, so the implementation for push is straightforward.

func push(_ node: Node) {
    ll.insertNode(node, at: 1)
}
Each time we push a new node onto the stack, the new node becomes the head.
Pop
Because the the top of the stack will always be the head node, we know we can set the head to the second element. However, we also need a way to return the previous head node. We do this by getting the node at position 1 (or by accessing the head property). If the head is not nil, then we know it has a value, and because it’s the first element in the linked list, we can remove the head by calling deleteNode().

func pop() -> Node? {
    let deletedNode = ll.getNode(atPosition: 1)
    if let value = deletedNode?.value {
        ll.deleteNode(withValue: value)
    }
    return deletedNode
}
By keeping a reference to the old head in deletedNode, we can safely remove it. The second node is now at the top of the stack, and the deleted node is returned.