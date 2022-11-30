
let N = Int(readLine()!)!
var C = readLine()!.split{$0==" "}.map{Int(String($0))!}
let k = N/Int(readLine()!)!
var ans = ""

for i in stride(from: 0, to: N, by: k) {
    ans += C[i..<i+k].sorted().map{String($0)}.joined(separator: " ") + " "
}

print(ans)