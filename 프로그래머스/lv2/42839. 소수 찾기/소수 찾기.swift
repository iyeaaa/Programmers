import Foundation

func isPrime(_ n: Int) -> Bool {
    if n == 0 || n == 1 { return false }
    for i in stride(from: 2, through: n-1, by: 1) {
        if n % i == 0 { return false }
    }
    return true
}

func solution(_ numbers:String) -> Int {
    var numbers = Array(numbers).map{Int(String($0))!}
    let n = numbers.count
    var visit = [Bool](repeating: false, count: n)
    var set = Set<Int>()

    func dfs(_ strn: String) {
        let intStrn = Int(strn)!
        if isPrime(intStrn)  {
            set.insert(intStrn)
        }
        for i in 0..<n {
            if !visit[i] {
                visit[i] = true
                dfs(strn+String(numbers[i]))
                visit[i] = false
            }
        }
    }

    for i in 0..<n {
        if numbers[i] != 0 {
            visit[i] = true
            dfs(String(numbers[i]))
            visit[i] = false
        }
    }
    return set.count
}

