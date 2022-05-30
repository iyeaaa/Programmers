class Queue<T> {
    var en: [T]
    var de: [T] = []
    var isEmpty: Bool {
        en.isEmpty && de.isEmpty
    }
    init(_ q: [T]) {
        en = q
    }
    func push(_ n: T) {
        en.append(n)
    }
    func pop() -> T? {
        if de.isEmpty {
            de = en.reversed()
            en.removeAll()
        }
        return de.popLast()
    }
    var count: Int {
        en.count + de.count
    }
    var front: T? {
        if de.isEmpty {
            return en.first
        }
        return de.last
    }
    var back: T? {
        if en.isEmpty {
            return de.first
        }
        return en.last
    }
}

let list = Queue([Int]())
for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    if input[0] == "push" {
        list.push(Int(input[1])!)
    } else if input[0] == "pop" {
        if let p = list.pop() {
            print(p)
        } else {
            print(-1)
        }
    } else if input[0] == "size" {
        print(list.count)
    } else if input[0] == "empty" {
        print(list.isEmpty ? 1 : 0)
    } else if input[0] == "front" {
        if let f = list.front {
            print(f)
        } else {
            print(-1)
        }
    } else if input[0] == "back" {
        if let d = list.back {
            print(d)
        } else {
            print(-1)
        }
    }
}