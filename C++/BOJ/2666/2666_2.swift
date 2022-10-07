/**
* 메모리: 69104 KB, 시간: 48 ms
* 2022.10.07
* by Alub
*/
let INF = 987654321
let M = Int(readLine()!)!
let O = readLine()!.split{$0==" "}.map{Int(String($0))!}
var L = [Int](), N = Int(readLine()!)!
var memo = [[Int]](repeating: [Int](repeating: INF, count: M+1), count: N+1)

for _ in 0..<N {
    L.append(Int(readLine()!)!)
}

print(f(O[0], O[1], 0))

func f(_ xp: Int, _ yp: Int, _ pos: Int) -> Int {
    pos == N ? 0 : min(f(xp,L[pos],pos+1)+abs(yp-L[pos]), f(yp,L[pos],pos+1)+abs(xp-L[pos]))
}