let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, x) = (input[0], input[1])
var visit = [0] + makeSumArray(sum: readLine()!.split{$0==" "}.map{Int(String($0))!})

let result = findMax()
print(result.0 == 0 ? "SAD" : "\(result.0)\n\(result.1)")

func findMax() -> (Int, Int) {
    var max = 0
    for i in 0...n-x {
        let differ = visit[i+x] - visit[i]
        if max < differ {
            max = differ
        }
    }
    var day = 0
    for i in 0...n-x {
        let differ = visit[i+x] - visit[i]
        if max == differ {
            day += 1
        }
    }
    return (max, day)
}
func makeSumArray(sum: [Int]) -> [Int] {
    var t = 0
    var result = [Int](repeating: 0, count: n)
    for i in 0..<sum.count {
        t += sum[i]
        result[i] = t
    }
    return result
}