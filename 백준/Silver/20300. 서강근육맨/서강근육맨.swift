let N = Int(readLine()!)!
let list = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var M = N%2 == 0 ? 0 : list[N-1]

for i in 0..<N/2 {
    M = max(M, list[i]+list[N-i - (N%2==0 ? 1 : 2)])
}

print(M)