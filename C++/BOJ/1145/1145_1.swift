/**
* 메모리: 69104 KB, 시간: 44 ms
* 2022.09.11
* by Alub
*/
let L = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 1... {
    if L.filter({i%$0 == 0}).count >= 3 {
        print(i)
        break
    }
}