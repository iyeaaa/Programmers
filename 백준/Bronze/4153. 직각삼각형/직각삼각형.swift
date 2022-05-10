while true {
    let input = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
    if input[0] == 0 && input[1] == 0 && input[2] == 0 {
        break
    }
    if input[2]*input[2] == input[0]*input[0] + input[1]*input[1] {
        print("right")
    } else {
        print("wrong")
    }
}