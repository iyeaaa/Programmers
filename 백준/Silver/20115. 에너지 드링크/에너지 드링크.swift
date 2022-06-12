let n = Int(readLine()!)!
var drink = readLine()!.split{$0==" "}.map{Double(String($0))!}.sorted()

for i in 0..<n-1 {
    drink[n-1] += drink[i]/2
}

print(drink[n-1])