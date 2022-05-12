let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
print(min(m*(n-1)+m-1, n*(m-1)+n-1))