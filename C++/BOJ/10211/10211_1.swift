/**
* 메모리: 69104 KB, 시간: 976 ms
* 2022.09.15
* by Alub
*/
let T = Int(readLine()!)!
var answer = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    let L = readLine()!.split(separator: " ").map{Int(String($0))!}
    var maxValue = Int.min

    for i in 1...N {
        for j in 0...N-i {
            var sum = 0
            for k in j..<j+i {
                sum += L[k]
            }
            maxValue = max(maxValue, sum);
        }
    }

    answer += "\(maxValue)\n"
}

print(answer)