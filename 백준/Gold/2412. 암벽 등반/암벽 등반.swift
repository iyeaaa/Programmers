
// T.C: O(50000+50000*25) < 1e8*2

func isRoad(_ x: Int, _ y: Int) -> Bool {
    v.contains("\(x) \(y)")
}

func insert(_ x: Int, _ y: Int) {
    v.insert("\(x) \(y)")
}

let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, T) = (ip[0], ip[1])
var v = Set<String>()
var q = [(0, 0, 0)], idx = 0, flag = false

for _ in 0..<n {
    let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
    insert(ip[0], ip[1])
}

while idx < q.count {
    let (x, y, cnt) = q[idx]; idx+=1
    if y == T { print(cnt); flag=true; break }
    for i in -2...2 {
        for j in -2...2 {
            let nx = x+i, ny = y+j
            if !isRoad(nx, ny) { continue }
            v.remove("\(nx) \(ny)")
            q.append((nx, ny, cnt+1))
        }
    }
}

if !flag { print(-1) }