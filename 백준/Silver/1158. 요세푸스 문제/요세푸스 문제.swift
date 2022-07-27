let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var list = Array(1...N)
var point = K-1
var result = [Int]()

while true {
    result.append(list.remove(at: point))
    if list.isEmpty { break }
    point = (point+K-1) % list.count
}

print("<" + result.map{String($0)}.joined(separator: ", ") + ">")