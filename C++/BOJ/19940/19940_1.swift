/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.09.24
* by Alub
*/
var answer = ""

for _ in 0..<Int(readLine()!)! {
    var N = Int(readLine()!)!
    var ADDH = 0, ADDT = 0, MINT = 0, ADDO = 0, MINO = 0
    var remainder = N % 60

    if remainder > 35 {
        ADDH += N / 60 + 1
        remainder = (60*ADDH - N)
        MINT = remainder / 10

        N = remainder
        remainder %= 10

        if remainder > 5 {
            MINT += 1
            ADDO += 10 - remainder
        } else {
            MINO += remainder
        }
    } else {
        ADDH += N / 60
        remainder = (N - 60*ADDH)
        ADDT = remainder / 10

        N = remainder
        remainder %= 10

        if remainder > 5 {
            ADDT += 1
            MINO += 10 - remainder
        } else {
            ADDO += remainder
        }
    }

    answer += "\(ADDH) \(ADDT) \(MINT) \(ADDO) \(MINO)\n"
}

print(answer)