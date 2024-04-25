class Node {
    var value: Int
    var next: Node?
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

var head: Node? = nil
var tail: Node? = head

func append(value: Int) {
    let newNode = Node(value: value, next:nil)
    if head == nil {
        head = newNode
        tail = head
        return
    }
    tail!.next = newNode
    tail = newNode
    return
}

func pop() -> Node?{
    let curr = head
    if head == nil {
        print("Linked list is empty")
        return nil
    }
    if head === tail {
        head = nil
        tail = nil
        return curr
    }
    head = head!.next
    return curr
}

func push(value: Int) {
    let curr = head
    let newNode = Node(value: value, next: curr)
    head = newNode
}

func reverse() {
    var curr = head
    var prev: Node? = nil
    var next: Node? = nil
    while curr != nil {
        next = curr!.next
        curr!.next = prev
        prev = curr
        curr = next
    }
    head = prev
}

func printList() {
    var curr = head
    while curr != nil {
        print(curr!.value)
        curr = curr!.next
    }
}

func main() {
    append(value: 1)
    append(value: 2)
    append(value: 3)
    append(value: 4)
    let _ = pop()
    push(value: 1)
    reverse()
    printList()
}

main()