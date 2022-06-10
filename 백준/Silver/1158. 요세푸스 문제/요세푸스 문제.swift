import Foundation

let josephus = readLine()!.components(separatedBy: " ").map({Int($0)!}) // [N, K]
var nums: [Int] = Array(1...josephus[0]) // [1...N]
var check = josephus[1] - 1 // K - 1
var result = [Int]() // 결과 순열

while true {
    result.append(nums.remove(at: check))
    if nums.isEmpty { break }
    check = (check + josephus[1] - 1) % nums.count
}

print("<" + result.map({String($0)}).joined(separator: ", ") + ">")