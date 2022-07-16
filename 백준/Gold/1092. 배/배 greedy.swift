let N = Int(readLine()!)!
let cranes = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)
let M = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)

if cranes[0] < boxes[0] {
    print(-1)
} else {
    var time = 0
    while !boxes.isEmpty {
        for crane in cranes {
            for (i, box) in boxes.enumerated() {
                if crane >= box {
                    boxes.remove(at: i)
                    break
                }
            }
        }
        time += 1
    }
    print(time)
}
