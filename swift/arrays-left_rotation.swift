/*
 * Complete the 'rotLeft' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY a
 *  2. INTEGER d
 */

func rotLeft(a: [Int], d: Int) -> [Int] {
    return Array(a.suffix(from: d) + a.prefix(d))
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let d = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let a: [Int] = aTemp.split(separator: " ").map {
    if let aItem = Int($0) {
        return aItem
    } else { fatalError("Bad input") }
}

guard a.count == n else { fatalError("Bad input") }

let result = rotLeft(a: a, d: d)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)