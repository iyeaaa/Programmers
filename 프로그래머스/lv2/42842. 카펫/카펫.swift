import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    for i in 1...sum {
        if sum % i == 0 && isCrt(brown, yellow, sum/i, i) {
            return [sum/i, i]
        }
    }
    return []
}


func isCrt(_ brwon: Int, _ yello: Int, _ x: Int, _ y: Int) -> Bool {
    let br = x + x + y-2 + y-2
    let ye = x*y - br
    return br == brwon && ye == yello
}
