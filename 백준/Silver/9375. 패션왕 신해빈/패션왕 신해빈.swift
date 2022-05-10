var Case = Int(readLine()!)!

while Case > 0 {
    var dict = [String:Int]()
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let input = readLine()!.split{$0==" "}.map{String($0)}
        if dict.keys.contains(input[1]) {
            dict[input[1]]! += 1
        } else {
            dict[input[1]] = 2
        }
    }
    var result = 1
    var array = Array(dict.values)
    for i in 0..<dict.count {
        result *= array[i]
    }
    print(result-1)
    Case -= 1
}