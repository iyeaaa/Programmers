
func pd(_ x: [[Int]], _ y: [[Int]]) -> [[Int]] {
    let len = x.count
    var rtn = [[Int]](repeating: [Int](repeating: 0, count: len), count: len)
    for i in 0..<len {
        for j in 0..<len {
            var temp = 0
            for c in 0..<len {
                temp = (temp + x[i][c]*y[c][j]) % MOD
            }
            rtn[i][j] = temp
        }
    }
    return rtn
}

let MOD = 1000
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, B) = (ip[0], ip[1])
var A = [[Int]]()
var rtn: [[Int]]

for _ in 0..<N {
    A.append(readLine()!.split{$0==" "}.map{Int(String($0))!%MOD})
}

rtn = f(B)
for i in 0..<N {
    for j in 0..<N {
        print(rtn[i][j], terminator: " ")
    }
    print()
}

func f(_ x: Int) -> [[Int]] {
    if x == 1 { return A }
    let temp = f(x/2)
    if x % 2 == 0 {
        return pd(temp, temp)
    }
    return pd(pd(temp, temp), f(1))
}