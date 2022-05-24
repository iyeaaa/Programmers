let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (x, y) = (input[0], input[1])
let z = y*100/x
var isChange = false

var start = 1
var end = x

while start <= end {
    let mid = (start + end) / 2
    let isDiffer = (y+mid)*100/(x+mid) != z
    if isDiffer {
        end = mid - 1
        isChange = true
    } else {
        start = mid + 1
    }
}

print( isChange ? start : -1 )

