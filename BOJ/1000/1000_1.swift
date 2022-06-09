/**
* 메모리: 69104 KB, 시간: 12 ms
* 2022.06.10
* by Alub
*/
print(readLine()!.split{$0==" "}.map{Int(String($0))!}.reduce(0){$0+$1})