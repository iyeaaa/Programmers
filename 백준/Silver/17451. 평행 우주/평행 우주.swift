let n = Int(readLine()!)!
let star = readLine()!.split{$0==" "}.map{Int(String($0))!}

var (start, end) = (1, Int.max-1)
while start <= end {    // 오름차순
    let mid = (start + end) / 2
    if isPossible(mid) {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(start)

func isPossible(_ speed: Int) -> Bool {
    var speed = speed
    for s in star {
        if s > speed {
            return false
        } else {
            speed = (speed / s) * s
        }
    }
    return true
}