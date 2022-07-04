import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var kindOfClothes = [String: [String]]()
    for c in clothes {
        kindOfClothes[c[1], default: []].append(c[0])
    }
    return -1 + kindOfClothes.reduce(1) {
        $0 * ($1.value.count+1)
    }
}