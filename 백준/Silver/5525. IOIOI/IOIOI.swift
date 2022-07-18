let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map{$0}

var result = 0
var compare = 0
var i = 0
while i < m-2 {
    if String(s[i...i+2]) == "IOI" {
        compare += 1
        if compare == n {
            compare -= 1
            result += 1
        }
        i += 1
    } else {
        compare = 0
    }
    i += 1
}

print(result)