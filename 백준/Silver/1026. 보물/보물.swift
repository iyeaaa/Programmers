let n = Int(readLine()!)!

var a = readLine()!.split{$0==" "}.map{Int(String($0))!}
var b = readLine()!.split{$0==" "}.map{Int(String($0))!}

a = a.sorted(by: < )
b = b.sorted(by: > )

var result = 0

for i in 0..<n {
    result += a[i]*b[i]
}

print(result)
