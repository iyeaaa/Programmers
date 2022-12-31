
let ip = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M) = (ip[0], ip[1])
var heap = [Int](repeating: 0, count: M)

readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted(by:>).forEach{
    heap.sort()
    heap[0] += $0
}

print(heap.max()!)