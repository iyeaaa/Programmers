let N = Int(readLine()!)!
var queue = Array(1...N)
var idx = 0

while queue.count - idx > 1 {
    idx += 1
    queue.append(queue[idx])
    idx += 1
}

print(queue[idx])