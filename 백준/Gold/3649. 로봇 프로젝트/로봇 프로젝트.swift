
var ans = ""
f:while let x = readLine() {
    let x = Int(x)!*10000000, n = Int(readLine()!)!
    var l = [Int](); for _ in 0..<n {l.append(Int(readLine()!)!)}
    l.sort()
    var lf = 0, ryt = l.count-1
    while lf < ryt {
        let sum = l[lf]+l[ryt]
        if sum == x { ans += "yes \(l[lf]) \(l[ryt])\n"; continue f }
        if sum < x { lf += 1 } else { ryt -= 1 }
    }
    ans += "danger\n"
}
print(ans)