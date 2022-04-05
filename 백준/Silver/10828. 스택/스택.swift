let n = Int(readLine()!)!
var stack = [Int]()

for _ in 1...n {
    let cmd = readLine()!.split{$0==" "}.map{String($0)}
    
    switch(cmd[0]) {
    case "push":
        push(Int(cmd[1])!)
    case "pop":
        print(pop())
    case "top":
        print(top())
    case "size":
        print(size())
    case "empty":
        print(empty())
    default:
        break
    }
}




func push(_ value: Int) {
    stack.append(value)
}

func pop() -> Int {
    if let pop = stack.popLast() {
        return pop
    }
    else {
        return -1
    }
}

func top() -> Int {
    if let topValue = stack.last {
        return topValue
    }
    else {
        return -1
    }
}

func size() -> Int {
    let size = stack.count
    return size
}

func empty() -> Int {
    if stack.isEmpty {
        return 1
    }
    else {
        return 0
    }
}
