
func lower_bound(_ arr: inout [Int], _ key: Int) -> Int {
    var lf = 0, ryt = arr.count
    while lf < ryt {
        let mid = (lf + ryt) / 2
        if arr[mid] >= key { ryt = mid }
        else { lf = mid + 1 }
    }
    return ryt
}

let n = Int(readLine()!)!
var l = [Int](repeating: 0, count: n+1)
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
for (i, v) in input.enumerated() { l[v] = i+1 }
var stack = [l[1]]

for i in stride(from: 2, through: n, by: 1) {
    if stack.last! < l[i] { stack.append(l[i]) }
    stack[lower_bound(&stack, l[i])] = l[i]
}

print(stack.count)