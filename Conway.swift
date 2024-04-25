import Foundation

func printMap(map: [[Int]]) -> Void {
    print(String(repeating: "\n", count: 25))
    for i in 0..<map.count {
        var row = ""
        for j in 0..<map[0].count {
            switch map[i][j] {
                case 0:
                    row += " "
                case 1:
                    row += "*"
                default:
                    break
            }
        }
        print(row)
    }
}

func countLiveNeighbour(map: [[Int]], x: Int, y: Int) -> Int {
    let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    let height = map.count
    let width = map[0].count
    var liveNeighbour = 0

    for dir in directions {
        let newX = x + dir.0
        let newY = y + dir.1
        if newX >= 0 && newX < width && newY >= 0 && newY < height && map[newY][newX] == 1 {
            liveNeighbour += 1
        }
    }
    return liveNeighbour
}

func gameOfLife(map: [[Int]]) -> Void {
    var currentMap = map
    var livingCellCount = 0
    repeat {
        var newMap = currentMap
        for y in 0..<currentMap.count {
            for x in 0..<currentMap[0].count {
                let neighbour = countLiveNeighbour(map: currentMap, x: x, y: y)
                if neighbour == 3 {
                    newMap[y][x] = 1
                } else if neighbour < 2 || neighbour > 3 {
                    newMap[y][x] = 0
                }
                if newMap[y][x] == 1 {
                    livingCellCount += 1
                }
            }
        }
        currentMap = newMap
        printMap(map: currentMap)
        sleep(1)
    } while livingCellCount > 0
}

func main() {
    let width = 10
    let height = 10
    var map = Array(repeating: Array(repeating: 0, count: width), count: height)
    for i in 0..<height {
        for j in 0..<width {
            map[i][j] = Int.random(in: 0...1)
        }
    }
    gameOfLife(map: map)
}

main()