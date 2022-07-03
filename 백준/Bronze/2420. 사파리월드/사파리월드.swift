let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
print(abs(input[0]-input[1]))