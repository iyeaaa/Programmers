var arr1 = Array(readLine()!)
var arr2 = Array(readLine()!)
var arr3 = Array(readLine()!)
var arr4 = Array(readLine()!)
var arr5 = Array(readLine()!)

arr1 = arr1 + Array(repeating: " ", count: 15-arr1.count)
arr2 = arr2 + Array(repeating: " ", count: 15-arr2.count)
arr3 = arr3 + Array(repeating: " ", count: 15-arr3.count)
arr4 = arr4 + Array(repeating: " ", count: 15-arr4.count)
arr5 = arr5 + Array(repeating: " ", count: 15-arr5.count)

var result = ""
for i in 0..<15 {
    result += (arr1[i] != " " ? String(arr1[i]) : "")
    result += (arr2[i] != " " ? String(arr2[i]) : "")
    result += (arr3[i] != " " ? String(arr3[i]) : "")
    result += (arr4[i] != " " ? String(arr4[i]) : "")
    result += (arr5[i] != " " ? String(arr5[i]) : "")
}

print(result)