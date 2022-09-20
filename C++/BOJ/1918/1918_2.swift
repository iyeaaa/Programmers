/**
* 메모리: 69100 KB, 시간: 8 ms
* 2022.09.20
* by Alub
*/
func rank(_ x: Character) -> Int {
    if x == "(" { return 3 }
    if x == "+" || x == "-" { return 2 }
    if x == "*" || x == "/" { return 1 }
    return 0
}

var stack = [Character]()
var ans = ""

for x in readLine()! {
    if x <= "Z" && x >= "A" {
        ans.append(x)
    } else if x == ")" {
        while !stack.isEmpty && stack.last! != "(" {
            ans.append(stack.popLast()!)
        }
        stack.removeLast()
    } else if x == "(" {
        stack.append(x)
    } else {
        while !stack.isEmpty && rank(stack.last!) <= rank(x) {
            ans.append(stack.popLast()!)
        }
        stack.append(x)
    }
}

while !stack.isEmpty {
    ans.append(stack.popLast()!)
}

print(ans)