import Foundation

func solution(_ numbers:[Int]) -> String {
    rmvZero(numbers.sorted{ three($0) > three($1) }.map{String($0)}.joined())
}

func three(_ n: Int) -> String {
    let n = String(n)
    return n+n+n
}

func rmvZero(_ s: String) -> String {
    var s = s, n = s.count
    while s.first! == "0" && n != 1 {
        s = String(s.dropFirst())
        n -= 1
    }
    return s
}
