
func f(_ str: inout [Character], _ hi: Int) -> Bool {
    if 0 == hi {
        return true
    }
    var lf = 0, ryt = hi
    while lf != ryt {
        if str[lf] == str[ryt] {
            return false
        }
        lf += 1; ryt -= 1
    }
    return f(&str, ryt-1)
}

let T = Int(readLine()!)!
var L = [[Character]]()
var ans = ""

for _ in 0..<T {
    var str = Array(readLine()!)
    ans += "\(f(&str, str.count-1) ? "YES" : "NO")\n"
}

print(ans)