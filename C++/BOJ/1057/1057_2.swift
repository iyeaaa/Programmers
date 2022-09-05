/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.05
* by Alub
*/
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
var (K, I) = (input[1], input[2])

for round in 1...100000 {
    if (K+1)/2 == (I+1)/2 {
        print(round)
        break
    }
    K = (K+1)/2
    I = (I+1)/2
}