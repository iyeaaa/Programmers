
import Foundation

let code = Array("abcdefghijklmnopqrstuvwxyz")
f: for _ in 0..<Int(readLine()!)! {
    var count = [Int](repeating: 0, count: 26)
    for s in readLine()! {
        if s == " " { continue }
        count[Int(s.unicodeScalars.first!.value)-97] += 1
    }

    let max = count.max()!
    var maxCount = 0
    var maxIndex = 0
    for i in 0..<count.count {
        if max == count[i] {
            maxCount += 1
            maxIndex = i
            if maxCount == 2 {
                print("?"); continue f
            }
        }
    }

    print(code[maxIndex])
}
