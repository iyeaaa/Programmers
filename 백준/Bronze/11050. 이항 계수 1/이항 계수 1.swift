let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, k) = (input[0], input[1])

print(factorial(n)/(factorial(k)*factorial(n-k)))

func factorial(_ n: Int) -> Int {
    var result = 1
    for i in stride(from: 1, through: n, by: 1) {
        result *= i
    }
    return result
}