let input = readLine()!.split{$0==" "}.map{Double(String($0))!}
let (n, l, w, h) = (input[0], input[1], input[2], input[3])

var (start, end) = (0.0, min(l, w, h))
for _ in 0..<10000 {
    let mid = (start + end) / 2
    if Int(l/mid) * Int(w/mid) * Int(h/mid) < Int(n) {
        end = mid
    } else {
        start = mid
    }
}

print(start)
