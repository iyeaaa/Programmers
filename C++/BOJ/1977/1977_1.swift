/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.09.03
* by Alub
*/
let M = Int(readLine()!)!
let N = Int(readLine()!)!
var ANS = [Bool](repeating: false, count: 10001)

for i in 1...10000 {
    if i*i > N { break }
    ANS[i*i] = true
}

var sum = 0, mV = 0, first = true
for i in M...N where ANS[i] {
    sum += i
    if first {
        mV = i
        first = false
    }
}
print(sum == 0 ? -1 : "\(sum)\n\(mV)")