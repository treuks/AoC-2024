import Foundation

func parse_line(line: String) -> (Int, Int) {
    let parts = line.split(separator: "   ")

    let left = String(parts[0])
    let right = String(parts[1])

    return (Int(left)!, Int(right)!)
}

func getDistances(lh: [Int], rh: [Int]) -> Int {
    var dist = 0
    for (left, right) in zip(lh, rh) {
        var d = left - right
        if d < 0 {
            d *= -1
        }
        dist += d
    }
    return dist
}

func partOne(_ leftList: [Int], _ rightList: [Int]) -> Int {

    let left = leftList.sorted()
    let right = rightList.sorted()

    let distances: Int = getDistances(lh: left, rh: right)

    return distances
}

func partTwo(_ leftList: [Int], _ rightList: [Int]) -> Int {

    var distances: [Int] = []

    for num in leftList {
        distances.append(num * rightList.count(where: { $0 == num }))
    }

    let totalDistance = distances.reduce(0) {
        (count, element) in
        return count + element
    }

    return totalDistance
}

let input = try String(contentsOfFile: "./input.txt", encoding: String.Encoding.utf8)
let lines = input.components(separatedBy: "\n")

var left_numbers: [Int] = []
var right_numbers: [Int] = []

for line in lines {
    let (left, right) = parse_line(line: line)
    left_numbers.append(left)
    right_numbers.append(right)
}

let p1 = partOne(left_numbers, right_numbers)
let p2 = partTwo(left_numbers, right_numbers)

print("Part 1 | Distance   : \(p1)")
print("Part 2 | Similarity : \(p2)")
