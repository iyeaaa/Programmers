
func f(_ str: inout [Character],_ lo: Int, _ hi: Int) -> Bool {
    if lo == hi {
        return true
    }
    var lf = lo, ryt = hi
    while lf != ryt {
        if str[lf] == str[ryt] {
            return false
        }
        lf += 1; ryt -= 1
    }
    return f(&str, lo, ryt-1)
}

let T = Int(readLine()!)!
var L = [[Character]]()
var ans = ""

for _ in 0..<T {
    var str = Array(readLine()!)
    ans += "\(f(&str, 0, str.count-1) ? "YES" : "NO")\n"
}

print(ans)