func fibonacci(n: Int) -> Int {
    return n <= 1 ? n : fibonacci(n: n-1) + fibonacci(n: n-2)
}

let n = Int(readLine()!)!

print(fibonacci(n: n))
