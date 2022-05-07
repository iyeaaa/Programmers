let n = Int(readLine()!)!

for _ in 0..<n {
    let temp = readLine()!.split{$0==","}.map{Int(String($0))!}
    print(temp[0]+temp[1])
}