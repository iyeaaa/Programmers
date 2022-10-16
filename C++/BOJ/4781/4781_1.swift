/**
* 메모리: 69448 KB, 시간: 1152 ms
* 2022.10.16
* by Alub
*/
var ans = ""
while true {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    let (n, m) = (Int(input[0])!, Int(Double(input[1])!*100+0.5))
    var memo = [Int](repeating: 0, count: m+1)
    var C = [(Int, Int)]()

    if n == 0 && m == 0 { break }

    for _ in 1...n {
        let input = readLine()!.split{$0==" "}.map{String($0)}
        let (calorie, cost) = (Int(input[0])!, Int(Double(input[1])!*100+0.5))
        C.append((calorie, cost))
    }

    for i in 1...m {
        for (calorie, cost) in C where i - cost >= 0 {
            memo[i] = max(memo[i], memo[i-cost] + calorie)
        }
    }

    ans += "\(memo.max()!)\n"
}

print(ans)