/**
* 메모리: 77080 KB, 시간: 104 ms
* 2022.10.12
* by Alub
*/
let MOD = 1_000_000_007
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var memo = [[Int]](repeating: [Int](repeating: -1, count: m+1), count: n+1)

print(f(n, m))

func f(_ y: Int, _ x: Int) -> Int {
    if y < 1 || x < 1 {
        return 0
    }
    if y == 1 && x == 1 {
        return 1
    }
    if memo[y][x] != -1 {
        return memo[y][x]
    }
    memo[y][x] = (f(y, x-1) + f(y-1, x) + f(y-1, x-1)) % MOD
    return memo[y][x]
}