func isPsb(_ len: Int, _ list: [Int], _ target: Int) -> Bool { list.map{ $0/len }.reduce(0, +) >= target }

func solve() {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (k, n) = (input[0], input[1])
    var ran = [Int](); for _ in 0..<k { ran.append(Int(readLine()!)!) }

    var (lf, ryt) = (1, ran.max()!)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(mid, ran, n) {
            lf = mid + 1
        } else {
            ryt = mid - 1
        }
    }
    print(ryt)
}

solve()