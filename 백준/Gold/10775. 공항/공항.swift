let G = Int(readLine()!)!
let P = Int(readLine()!)!
var gate = Array(0...G)

var result = 0
for _ in 0..<P {
    let docking = root(of: Int(readLine()!)!)
    if root(of: docking) == 0 {
        break
    } else {
        merge(docking, with: docking-1)
        result += 1
    }
}

print(result)

func root(of x : Int) -> Int {
    if x == gate[x] {
        return x
    }
    gate[x] = root(of: gate[x])
    return gate[x]
}
func merge(_ x: Int, with y: Int) {
    let (x, y) = (root(of: x), root(of: y))
    if x == y { return }
    gate[x] = y
}
