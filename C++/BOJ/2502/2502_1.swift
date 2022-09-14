/**
* 메모리: 69104 KB, 시간: 8 ms
* 2022.09.14
* by Alub
*/
let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (D, K) = (input[0], input[1])

for i in stride(from: 1, to: K, by: 1) {
    var today = K
    var yesterday = i
    for _ in stride(from: D-1, through: 2, by: -1) {
        let to = today
        today = yesterday
        yesterday = to - yesterday
        if (yesterday > today) {
            yesterday = 0
            break
        }
    }
    if yesterday > 0 {
        print(yesterday)
        print(today)
        break
    }
}