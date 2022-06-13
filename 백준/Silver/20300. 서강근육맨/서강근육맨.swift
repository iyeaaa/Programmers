let n = Int(readLine()!)!
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
var result = 0
if n % 2 == 0 {
    for i in 0..<n/2 {
        result = max(result, input[i]+input[n-i-1])
    }
} else {
    result = input[n-1]
    for i in 0..<(n-1)/2 {
        result = max(result, input[i]+input[n-i-2])
    }
}

print(result)