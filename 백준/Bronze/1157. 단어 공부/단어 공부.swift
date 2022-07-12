extension Character {
    var ascii: Int {
        Int(unicodeScalars.first!.value)
    }
}

extension Int {
    var toChar: Character {
        Character(UnicodeScalar(65+self)!)
    }
}

var apb = [Int](repeating: 0, count: 26)

for s in readLine()! {
    var n = s.ascii; if n >= 97 { n -= 32 }
    apb[n-65] += 1
}

let maxValue = apb.max()!
let maxValueIndex = apb.firstIndex(of: maxValue)!
let maxList = apb.filter{ maxValue == $0 }

if maxList.count > 1 {
    print("?")
} else {
    print(maxValueIndex.toChar)
}
