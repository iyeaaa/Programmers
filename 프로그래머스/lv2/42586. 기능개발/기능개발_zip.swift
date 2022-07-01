import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    return zip(progresses, speeds)
        .map { (100 - $0) / $1 }
        .reduce(([], 0)) { (tuple, day) -> ([Int], Int) in
            let (list, lastMax) = tuple
            guard let lastCount = list.last else {
                return ([1], day)
            }
            if lastMax >= day {
                return (list.dropLast() + [lastCount + 1], lastMax)
            }
            return (list + [1], day)
        }.0
}

// from 송치원
