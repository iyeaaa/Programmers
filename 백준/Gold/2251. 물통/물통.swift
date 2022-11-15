
// T.C = 200^3*8 + 200^3 < 1e8

let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (A, B, C) = (input[0], input[1], input[2])
var v = (0...A).map{_ in (0...B).map{_ in (0...C).map{_ in false}}}
var q = [(0, 0, C)], idx = 0
var ans = [Int]()

while idx < q.count {
    let (a, b, c) = q[idx]; idx += 1

    if v[a][b][c] { continue }
    if a == 0 { ans.append(c) }

    v[a][b][c] = true;

    if a < (B-b) { q.append((0, b+a, c)) }
    else { q.append((a-(B-b), B, c)) }

    if a < (C-c) { q.append((0, b, c+a)) }
    else { q.append((a-(C-c), b, C)) }

    if b < (A-a) { q.append((a+b, 0, c)) }
    else { q.append((A, b-(A-a), c)) }

    if b < (C-c) { q.append((a, 0, c+b)) }
    else { q.append((a, b-(C-c), C)) }

    if c < (A-a) { q.append((a+c, b, 0)) }
    else { q.append((A, b, c-(A-a))) }

    if c < (B-b) { q.append((a, b+c, 0)) }
    else { q.append((a, B, c-(B-b))) }
}

print(ans.sorted().map{String($0)}.joined(separator: " "))