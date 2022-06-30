import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    func isPsb(_ m: Int) -> Bool { times.reduce(0){$0 + (m/$1)} >= n }
    var (lf, ryt) = (0, 100000000000000)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(mid) {
            ryt = mid - 1
        } else {
            lf = mid + 1
        }
    }
    return Int64(lf)
}