import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    commands.map({ k in
        array[(k[0]-1)...(k[1]-1)].sorted()[k[2]-1]
    })
}