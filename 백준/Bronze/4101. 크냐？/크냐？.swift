while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
    if input == [0, 0] {
        break
    }
    print(input[0] > input[1] ? "Yes" : "No")
}