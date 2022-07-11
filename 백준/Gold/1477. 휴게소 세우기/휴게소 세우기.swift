let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (N, M, L) = (input[0]+2, input[1], input[2])
var rests = [0] + readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted() + [L]

for i in (1...L) {
    if !isPsb(i) {
        print(i)
        break
    }
}

func isPsb(_ x: Int) -> Bool {
    var count = 0
    for i in 1..<N {
        let dfrnt = rests[i] - rests[i-1]
        count += dfrnt/x - (dfrnt%x == 0 ? 1 : 0)
    }
    return count > M
}