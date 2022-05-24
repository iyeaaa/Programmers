import Foundation

let n = Double(readLine()!)!
var start = 0.0
var end = n

while start <= end {
    let mid = Double(Int((start+end) / 2))
    if mid*mid < n {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(Int(start))