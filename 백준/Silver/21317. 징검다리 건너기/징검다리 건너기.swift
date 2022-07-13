import Foundation

typealias Stone = (s: Int, l: Int)

let N = Int(readLine()!)!
var stones = crtStones()
let K = Int(readLine()!)!
var minEnergy = Int.max

dfs(0, 0, false)
print(minEnergy)


func dfs(_ stt: Int, _ sumE: Int, _ useK: Bool) {
    if stt == N-1 {
        minEnergy = min(minEnergy, sumE)
        return
    }
    if stt+1 <= N {
        dfs(stt+1, sumE+stones[stt].s, useK)
    }
    if stt+2 <= N {
        dfs(stt+2, sumE+stones[stt].l, useK)
    }
    if stt+3 <= N && !useK {
        dfs(stt+3, sumE+K, true)
    }
}

func crtStones() -> [Stone] {
    var result = [Stone]()
    for _ in 0..<N-1 {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        result.append(Stone(s: input[0], l: input[1]))
    }
    return result
}