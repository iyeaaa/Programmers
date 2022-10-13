/**
* 메모리: 69108 KB, 시간: 8 ms
* 2022.10.13
* by Alub
*/
// f(n): n번까지 색종이로 n번을 사용해 쌓을 수 있는 최대 색종이 개수
// f(n) = max(f(0 ~ n-1)) + 1

let N = Int(readLine()!)!
var P = [(Int, Int)]()
var memo = [Int](repeating: 1, count: N)

for _ in 0..<N {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    P.append((input[0], input[1]))
}

P.sort{$0.0 * $0.1 > $1.0 * $1.1}

for i in 0..<N {
    for j in 0..<i {
        if P[j].0 >= P[i].0 && P[j].1 >= P[i].1 || P[j].0 >= P[i].1 && P[j].1 >= P[i].0 {
            memo[i] = max(memo[i], memo[j] + 1)
        }
    }
}

print(memo.max()!)
