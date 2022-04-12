import Foundation

let n = Int(readLine()!)!
var result = ""

first : for _ in 1...n {
    var count = 0
    var str = readLine()!

    for i in str {
        if String(i) == "(" {
            count += 1
        }
        else {
            count -= 1
        }

        if count < 0 {
            result += "NO\n"
            continue first
        }
    }

    if count != 0 {
        result += "NO\n"
    } else {
        result += "YES\n"
    }
}

print(result)