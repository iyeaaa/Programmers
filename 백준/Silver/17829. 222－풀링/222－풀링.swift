
let N = Int(readLine()!)!
var g = [[Int]]()

for _ in 0..<N {
    g.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}

print(f(0, 0, N))

func f(_ y: Int, _ x: Int, _ len: Int) -> Int {
    if len == 2 {
        return [g[y][x], g[y+1][x], g[y][x+1], g[y+1][x+1]].sorted()[2]
    }
    return [f(y,x,len/2),f(y+len/2,x,len/2),f(y,x+len/2,len/2), f(y+len/2,x+len/2,len/2)].sorted()[2]
}