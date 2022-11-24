
let n = Int(readLine()!)!
let l = readLine()!.split{$0==" "}.map{Int(String($0))!}
var lf = 0, ryt = n-1
var dist = abs(l[lf] + l[ryt])
var ansLf = l[lf], ansRyt = l[ryt]

while lf < ryt {
    let sum = l[lf] + l[ryt]
    if dist > abs(sum) {
        ansLf = l[lf]; ansRyt = l[ryt]
        dist = abs(sum)
    }
    if sum < 0 {
        lf += 1
    } else {
        ryt -= 1
    }
}

print(ansLf, ansRyt)
