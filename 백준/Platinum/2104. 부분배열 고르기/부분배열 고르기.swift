
let N = Int(readLine()!)!
let A = [0]+readLine()!.split{$0==" "}.map{Int(String($0))!}

print(f(1, N))

func midArea(_ mid: Int, _ s: Int, _ e: Int) -> Int {
    var lo = mid, hi = lo+1
    var sum = A[lo]+A[hi], mn = min(A[lo], A[hi]), rtn = sum*mn

    while lo > s || hi < e {
        func update(_ x: Int) {
            sum += x
            mn = min(mn, x)
            rtn = max(rtn, sum * mn)
        }
        func loMove() { lo -= 1; update(A[lo]) }
        func hiMove() { hi += 1; update(A[hi]) }
        if lo == s { hiMove() }
        else if hi == e { loMove() }
        else { A[lo-1] > A[hi+1] ? loMove() : hiMove() }
    }

    return rtn
}

func f(_ lo: Int, _ hi: Int) -> Int {
    if lo == hi { return A[lo]*A[lo] }
    let mid = (lo + hi) >> 1
    return max(midArea(mid, lo, hi), f(lo, mid), f(mid+1, hi))
}