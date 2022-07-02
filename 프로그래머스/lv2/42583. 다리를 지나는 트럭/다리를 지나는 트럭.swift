import Foundation

struct Queue<T> {
    private var queue: [T]
    private var lf = 0, ryt = -1

    init() { queue = [T](); }
    init(_ n: T) { queue = [n]; ryt += 1 }
    init(_ n: [T]) { queue = n; ryt = n.count-1 }

    var isEmpty: Bool {
        ryt < lf
    }

    var count: Int {
        isEmpty ? 0 : ryt-lf+1
    }

    var first: T? {
        queue[lf]
    }

    var last: T? {
        queue[ryt]
    }

    func get(index: Int) -> T? {
        queue[lf+index]
    }

    mutating func push(_ n: T) {
        queue.append(n)
        ryt += 1
    }

    mutating func pop() -> T? {
        if isEmpty { return nil }
        defer { lf += 1 }
        return queue[lf]
    }

    mutating func removeFirst() {
        lf += 1
    }
}
class Truck {
    private let weight: Int
    private var position: Int // 왼쪽으로 갈수록 커짐

    init(_ w: Int, _ p: Int) {
        weight = w
        position = p
    }

    func move() {
        position += 1
    }

    func getWeight() -> Int {
        weight
    }

    func getPosition() -> Int {
        position
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    func sumWeight() -> Int {
        var result = 0
        for i in 0..<curTruck.count {
            result += curTruck.get(index: i)!.getWeight()
        }
        return result
    }

    var waitTruck = Queue<Truck>()
    for t in truck_weights { waitTruck.push(Truck(t, 0)) }
    var curTruck = Queue<Truck>()
    var time = 0
    while true {
        time += 1
        if curTruck.isEmpty && waitTruck.isEmpty {
            return time
        }
        if !waitTruck.isEmpty && sumWeight() + waitTruck.first!.getWeight() <= weight {
            curTruck.push(waitTruck.pop()!)
        }
        if !curTruck.isEmpty {
            for i in 0..<curTruck.count {
                let truck = curTruck.get(index: i)!
                truck.move()
            }
            while !curTruck.isEmpty && curTruck.first!.getPosition() == bridge_length {
                curTruck.removeFirst()
            }
        }
    }
    return -1
}
