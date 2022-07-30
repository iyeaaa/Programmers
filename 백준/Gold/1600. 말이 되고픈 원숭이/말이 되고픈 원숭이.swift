struct Pos{
    let x : (Int,Int)
    let horse : Int
    let cnt : Int

}
let dxy = [(0,1),(1,0),(-1,0),(0,-1)]
let horseDxy = [(-2,1),(-1,2),(1,2),(2,1),(2,-1),(1,-2),(-1,-2),(-2,-1)]

let k = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let w = arr[1], h = arr[0]
var map = [[Int]]()
var check = Array(repeating: Array(repeating: -1, count: h), count: w)

for _ in 0..<w{
    map.append( readLine()!.split(separator: " ").map{Int(String($0))!})

}
var index = 0
func bfs()->Int{
    var queue = [Pos]()
    check[0][0] = k
    queue.append(Pos(x:(0,0),horse:k,cnt:0))
    while queue.count > index{
        let pos = queue[index]
        if pos.x.0 == w-1 && pos.x.1 == h-1{
            return pos.cnt
        }

        for i in 0..<4{
            let next = (pos.x.0 + dxy[i].0, pos.x.1 + dxy[i].1)
            if next.0 >= w || next.1 >= h || next.0 < 0 || next.1 < 0 {continue}
            if check[next.0][next.1] >= pos.horse || map[next.0][next.1] == 1{continue}
            check[next.0][next.1] = pos.horse
            queue.append(Pos(x: (next.0,next.1),horse: pos.horse,cnt: pos.cnt+1))
        }
        if pos.horse < 0 {continue}
        for i in 0..<8{
            let next = (pos.x.0 + horseDxy[i].0, pos.x.1 + horseDxy[i].1)
            if next.0 >= w || next.1 >= h || next.0 < 0 || next.1 < 0 {continue}
            if check[next.0][next.1] >= pos.horse-1 || map[next.0][next.1] == 1{continue}
            check[next.0][next.1] = pos.horse - 1
            queue.append(Pos(x: (next.0,next.1),horse: pos.horse-1,cnt: pos.cnt+1))
        }

        index += 1
    }
    return -1
}
print(bfs())
