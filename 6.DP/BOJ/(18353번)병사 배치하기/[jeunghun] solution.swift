let n = Int(readLine()!)!
let data = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 0..<n - 1 {
    for j in i + 1..<n {
        if data[i] > data[j] {
            dp[j] = max(dp[i] + 1, dp[j])
        }
    }
}

print(n - dp.max()!)