func factorial(n: Int) -> Int{
    return n == 0 ? 1 : n * factorial(n: n-1)
}

let n = Int(readLine()!)!

print(factorial(n: n))
