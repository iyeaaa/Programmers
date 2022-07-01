import Foundation

func solution(_ citations:[Int]) -> Int {
    func isPsb(_ h: Int) -> Bool { citations.filter{ h <= $0 }.count >= h }

    var (lf, ryt) = (0, 10000)
    while lf <= ryt {
        let mid = (lf + ryt) / 2
        if isPsb(mid) {
            lf = mid + 1
        } else {
            ryt = mid - 1
        }
    }
    return ryt
}
