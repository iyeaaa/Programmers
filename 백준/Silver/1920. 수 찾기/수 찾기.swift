let n = Int(readLine()!)!
let array = readLine()!.split{$0==" "}.map{Int(String($0))!}.sorted()
let x = Int(readLine()!)!
let arr_x = readLine()!.split{$0==" "}.map{Int(String($0))!}
var result = ""

for i in arr_x {
    result += "\(binary_Search(key: i))\n"
}

print(result)

func binary_Search(key: Int) -> Int{
    var (start, end) = (0, array.count-1)
    while start <= end {
        let mid = (start+end)/2
        if array[mid] < key {
            start = mid + 1
        } else if array[mid] > key {
            end = mid - 1
        } else {
            return 1
        }
    }
    return 0
}