import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var elmt = [(i: Int, v: Int)]()
    for (i, v) in priorities.enumerated() {
        elmt.append((i: i, v: v))
    }
    var count = 1
    while !elmt.isEmpty {
        let maxIdx = maxIndex(elmt)
        let removed = elmt.removeFirst()
        if maxIdx != 0 {
            elmt.append(removed)
        } else {
            if removed.i == location {
                return count
            }
            count += 1
        }
    }
    return -1
}

func maxIndex(_ list: [(i: Int, v: Int)]) -> Int {
    var maxIdx = 0
    for i in 0..<list.count {
        if list[maxIdx].v < list[i].v {
            maxIdx = i
        }
    }
    return maxIdx
}