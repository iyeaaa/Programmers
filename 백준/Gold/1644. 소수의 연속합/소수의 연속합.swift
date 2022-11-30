
let N = Int(readLine()!)!
var isPrime = [Bool](repeating: true, count: 4_000_001)
var prime = [0]
var ans = 0

for i in 2...4000000 where isPrime[i] {
    var j = i+i
    prime.append(i)
    while j <= 4000000 {
        isPrime[j] = false
        j += i
    }
}

var lo = 0, hi = 0, sum = 0
while lo <= hi {
    if sum == N {ans+=1}
    if sum <= N {
        if hi + 1 >= prime.count { break }
        hi += 1; sum += prime[hi]
    } else {
        sum -= prime[lo]; lo += 1
    }
}

print(ans)