import Foundation

var apb = [Int](repeating: 0, count: 26)

for s in readLine()! {
    var n = ascii(s); if n >= 97 { n -= 32 }
    apb[n-65] += 1
}

let maxValue = apb.max()!
let maxValueIndex = apb.firstIndex(of: maxValue)!
let maxList = apb.filter{ maxValue == $0 }

if maxList.count > 1 {
    print("?")
} else {
    print(Character(UnicodeScalar(65+maxValueIndex)!))
}

func ascii(_ n: Character) -> Int {
    Int(n.unicodeScalars.first!.value)
}