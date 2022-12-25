

let N = Int(readLine()!)!
let cranes = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)
let M = Int(readLine()!)!
let boxes = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by:>)

var (lf, ryt) = (1, 10000)
while lf <= ryt {
    let mid = (lf + ryt) / 2
    if isPsb(mid) {
        ryt = mid - 1
    } else {
        lf = mid + 1
    }
}
print(lf == 10001 ? -1 : lf)


func isPsb(_ t: Int) -> Bool {
    var count = 0
    for crane in cranes {
        for _ in 0..<t {
            if count < M && crane >= boxes[count] {
                count += 1
            }
        }
    }
    return count == M
}