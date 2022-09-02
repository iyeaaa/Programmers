/**
* 메모리: 69108 KB, 시간: 652 ms
* 2022.09.02
* by Alub
*/
let N = Int(readLine()!)!
let M = Int(readLine()!)!
var B = [Bool](repeating: true, count: 10)

if (M != 0) {
    for e in readLine()!.split(separator: " ").map({ Int(String($0))! }) {
        B[e] = false;
    }
}

var ans = abs(N-100)

f: for i in 0...1000000 {
    let cur = Array(String(i)).map{Int(String($0))!};
    for emt in cur {
        if (!B[emt]) { continue f }
    }
    ans = min(ans, cur.count + abs(N-i))
}

print(ans)