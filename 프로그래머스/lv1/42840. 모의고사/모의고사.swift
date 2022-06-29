import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var one = [1, 2, 3, 4, 5]
    var two = [2, 1, 2, 3, 2, 4, 2, 5]
    var three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var count = Array(repeating: 0, count: 3)
    for i in stride(from: 0, to: answers.count, by: 1) {
        if one[i%5] == answers[i] {
            count[0] += 1
        }
        if two[i%8] == answers[i] {
            count[1] += 1
        }
        if three[i%10] == answers[i] {
            count[2] += 1
        }
    }
    var result = [Int]()
    let maxValue = count.max()!
    for i in 0..<3 {
        if count[i] == maxValue {
            result.append(i+1)
        }
    }
    return result
}
