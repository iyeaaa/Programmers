
let N = Int(readLine()!)!
let h = readLine()!.split(separator: " ").map{Int(String($0))!}
let sum = h.reduce(0, +)
let twoCnt = h.reduce(0){$0 + $1/2};

print(sum%3==0 && twoCnt >= sum/3 ? "YES" : "NO");