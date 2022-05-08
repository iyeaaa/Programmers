let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
print(input[1]*2-input[0])