let n = Int(readLine()!)!
var six = 665
var count = 0

while count != n {
    six += 1
    if isThreeSix(six) {
        count += 1
    }
}

print(six)

func isThreeSix(_ n: Int) -> Bool {
    var count = 0
    let arr_n = Array(String(n))
    for i in 0..<arr_n.count {
        if arr_n[i] == "6" {
            count += 1
            if count == 3 {
                return true
            }
        } else {
            count = 0
        }
    }
    return false
}