let CASE = Int(readLine()!)!

for _ in 0..<CASE {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    var graph = [[Int]](repeating: [], count: n+1)
    var visit = [Int](repeating: -1, count: n+1)

    for _ in 1...m {
        let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }

    print(n-1)
}