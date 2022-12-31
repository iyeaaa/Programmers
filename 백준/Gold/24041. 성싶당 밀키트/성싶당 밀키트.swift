
// Time Complexity: O(log1e9 * NlogN)
// Space Complexity: O(N)

/*
 Ingredient: 재료(S: 부패속도, L: 유통기한, O: 뺄수있는지 여부)
 N: 재료 개수, G: 최대 세균 개수, K: 뺄 수 있는 재료개수
 V: 뺄 수 없는 재료 목록
 OV: 뺄 수 있는 재료 목록
 */
typealias Ingredient = (S: Int, L: Int, O: Int)
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, G, K) = (ip[0], ip[1], ip[2])
var V = [Ingredient](), OV = [Ingredient]()

for _ in 0..<N {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if ip[2] == 0 {
        V.append((ip[0], ip[1], ip[2]))
    } else {
        OV.append((ip[0], ip[1], ip[2]))
    }
}

var lo = 1, hi = 2_000_000_001
while lo + 1 < hi {
    let mid = (lo + hi) >> 1
    if canEat(mid) {
        lo = mid
    } else {
        hi = mid
    }
}

print(lo)

// GermsCnt(v, x): x일에 재료v에 존재하는 세균 수, O(1)
func GermsCnt(_ v: Ingredient, _ x: Int) -> Int {
    v.S * max(1, x - v.L)
}

// canEat(x): x일에 먹을 수 있는지 여부, O(NlogN)
func canEat(_ x: Int) -> Bool {
    var germs = 0 // 총 재료의 세균 수
    for v in V {
        germs += GermsCnt(v, x)
    }
    OV.sort(by:{GermsCnt($0,x) < GermsCnt($1,x)})
    for i in 0..<max(0, OV.count-K) {
        germs += GermsCnt(OV[i], x)
    }
    return germs <= G
}