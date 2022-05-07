let array = Array(readLine()!).map{Int(String($0))!}.sorted(by: >)
if array.last! != 0 || array.reduce(0, +)%3 != 0 {
    print(-1)
} else {
    print(array.map{String($0)}.joined())
}