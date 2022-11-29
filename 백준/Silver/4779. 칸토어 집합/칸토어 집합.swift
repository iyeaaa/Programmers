
import Foundation

var ans = ""
while let ip = readLine() {
    let N = Double(ip)!
    ans += f(Int(pow(3.0, N))) + "\n"
    func f(_ len: Int) -> String {
        if len == 1 { return "-" }
        let temp = f(len/3)
        return temp + String(repeating: " ", count: len/3) + temp
    }
}
print(ans)