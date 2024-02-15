let n = Int(readLine()!)!
var data = Array<Array<Int>>()
var dp = (1..<n).map { i in
    Array(repeating: 0, count: i)
}

for _ in 0..<n {
    data.append(readLine()!.split(separator: " ").map { Int($0)! })
}

dp.append(data.last!)

for i in 0..<n - 1 {
    for j in 0..<n - i - 1 {
        dp[n - 2 - i][j] = max(dp[n - 1 - i][j] + data[n - 2 - i][j], dp[n - 1 - i][j + 1] + data[n - 2 - i][j])
    }
}

print(dp[0][0])