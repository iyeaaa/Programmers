let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, w, L) = (input[0], input[1], input[2])
let a = readLine()!.split(separator: " ").map{(0, Int(String($0))!)}
var aIdx = 0
var onA = [(Int, Int)](), oIdx = 0
var weight = 0
var time = 0

while aIdx < a.count || oIdx < onA.count {
    time += 1
    for i in stride(from: oIdx, to: onA.count, by: 1) {
        onA[i].0 += 1
        if onA[i].0 > w { oIdx += 1; weight -= onA[i].1 }
    }
    if aIdx < a.count && weight + a[aIdx].1 <= L {
        onA.append((1, a[aIdx].1))
        weight += a[aIdx].1
        aIdx += 1
    }
}

print(time)