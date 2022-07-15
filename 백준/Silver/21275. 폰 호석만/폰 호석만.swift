import Foundation

let input = readLine()!.split{$0==" "}.map{String($0)}
let (A, B) = (input[0], input[1])
var answer = [(Int, Int, Int)]()
for i in 2...36 {
    for j in 2...36 {
        if i == j { continue }
        guard let a = Int(A, radix: i) else { continue }
        guard let b = Int(B, radix: j) else { continue }
        if a == b {
            answer.append((a, i, j))
            if answer.count == 2 { break }
        }
    }
}
print(answer.isEmpty ? "Impossible" :
        answer.count == 1 ? "\(answer[0].0) \(answer[0].1) \(answer[0].2)" : "Multiple")