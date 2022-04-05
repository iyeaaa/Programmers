let n = Int(readLine()!)!
var result = ""
var count = 0

func hanoi(n: Int, s: Int, e: Int, v: Int) {
    count += 1
    
    if n == 1 {
        result += "\(s) \(e)\n"
    }
    else {
        hanoi(n: n-1, s: s, e: v, v: e)
        result += "\(s) \(e)\n"
        hanoi(n: n-1, s: v, e: e, v: s)
    }
}

hanoi(n: n, s: 1, e: 3, v: 2)

print(count)
print(result)
