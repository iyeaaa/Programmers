/**
* 메모리: 69104 KB, 시간: 12 ms
* 2022.09.13
* by Alub
*/
let T = Int(readLine()!)!

func gcd(_ y: Int, _ x: Int) -> Int {
    y % x == 0 ? x : gcd(x, y%x)
}

var result = ""
for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a, b) = (input[0], input[1])
    let gcd = gcd(b, a)
    result += "\(a*b/gcd) \(gcd)\n"
}
print(result)