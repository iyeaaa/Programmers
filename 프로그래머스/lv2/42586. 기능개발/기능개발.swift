import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses, speeds = speeds, idx = 0
    var result = [Int]()

    while idx < progresses.count {
        let hdrd = 100 - progresses[idx]
        let incrs = hdrd % speeds[idx] == 0 ? hdrd / speeds[idx] : hdrd / speeds[idx] + 1
        for i in idx..<progresses.count { progresses[i] += incrs*speeds[i] }
        var count = 0
        while idx < progresses.count && progresses[idx] >= 100 {
            idx += 1
            count += 1
        }
        result.append(count)
    }

    return result
}
