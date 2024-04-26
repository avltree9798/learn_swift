class Node {
    let data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkedList {
    private var head: Node?
    private var tail: Node?
    
    public func push(data: Int) -> Void {
        if self.head == nil {
            self.head = Node(data: data)
            self.tail = self.head
            return
        }
        let newNode = Node(data: data, next: self.head)
        self.head = newNode
    }
    
    public func pop() -> Node? {
        if self.tail == nil {
            return nil
        }
        var curr = self.head
        if self.head === self.tail {
            self.head = nil
            self.tail = nil
            return curr
        }
        while curr!.next !== tail {
            curr = curr!.next
        }
        let poppedNode = curr!.next
        curr!.next = nil
        return poppedNode
    }
    
    public func fetchAll() -> [Int] {
        var values: [Int] = []
        var curr = self.head
        while curr != nil {
            let current = curr!
            values.append(current.data)
            curr = current.next
        }
        return values
    }
    
    public func reverse() {
        assert(self.head != nil)
        var curr = self.head
        var next: Node? = nil
        var prev: Node? = nil
        while curr != nil {
            next = curr!.next
            curr!.next = prev
            prev = curr
            curr = next
        }
        self.head = prev
    }
}

func main() {
    let ll = LinkedList()
    for i in 0...10 {
        ll.push(data: i)
    }
    let _ = ll.pop()
    ll.reverse()
    print(ll.fetchAll())
}

main()
