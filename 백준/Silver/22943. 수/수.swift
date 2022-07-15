import Foundation


var isPrime = [Bool](repeating: true, count: 100001)

func makePrime() {
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...Int(sqrt(Double(100001))) {
        if isPrime[i] {
            for j in stride(from: i*i, to: 100001, by: i) {
                isPrime[j] = false
            }
        }
    }
}


let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (K, M) = (input[0], input[1])
let start = findStart(K)
var visit = [Bool](repeating: false, count: 10)
var list = [Int]()

for i in 1...9 {
    visit[i] = true
    permut(0, cur: String(i))
    visit[i] = false
}

makePrime()

var count = [Int]()
for i in list {
    for j in stride(from: 2, through: i/2, by: 1) {
        if j != i-j && isPrime[j] && isPrime[i-j] {
            count.append(i)
            break
        }
    }
}

var result = 0
for c in count {
    var x = c
    while x % M == 0 { x /= M }
    if isPrime[c] { continue }
    for i in stride(from: 2, through: Int(sqrt(Double(x))), by: 1) {
        if x % i == 0 && isPrime[i] && isPrime[x/i] {
            result += 1
            break
        }
    }
}

print(result)

func findStart(_ x: Int) -> Int {
    var result = 1
    for _ in 1..<x {
        result *= 10
    }
    return result
}

func permut(_ digit: Int, cur: String) {
    if digit == K-1 {
        list.append(Int(cur)!)
        return
    }
    for i in 0..<10 {
        if !visit[i] {
            visit[i] = true
            permut(digit+1, cur: cur+String(i))
            visit[i] = false
        }
    }
}