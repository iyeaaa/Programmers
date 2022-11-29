
let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
let BC = readLine()!.split{$0==" "}.map{Int(String($0))!}
let B = BC[0], C = BC[1]
print(N + A.reduce(0){$0 + ($1 <= B ? 0 : (($1-B)%C == 0 ? ($1-B)/C : (($1-B)/C+1)))})