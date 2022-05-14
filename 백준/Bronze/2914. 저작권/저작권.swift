let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (ea, average) = (input[0], input[1])

if ea == 1 {
    print(average)
} else {
    print(ea*(average-1)+1)
}