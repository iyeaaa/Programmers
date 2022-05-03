let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var stack = [Int]()
var visited = [Bool](repeating: false, count: n+1)
var result = ""

recusion(0)
print(result)

func recusion(_ num: Int) {
   if num == m {
      result += stack.map{String($0)}.joined(separator: " ")
      result += "\n"
   } else {
      for i in 1...n {
         if !visited[i] {
            visited[i] = true
            stack.append(i)
            recusion(num+1)
            visited[i] = false
            stack.popLast()
         }
      }
   }
}