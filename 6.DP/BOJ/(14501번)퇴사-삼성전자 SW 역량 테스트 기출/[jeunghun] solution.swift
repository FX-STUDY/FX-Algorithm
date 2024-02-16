let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n + 1)
var t = Array<Int>(), p = Array<Int>()
var maxValue = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    t.append(input[0])
    p.append(input[1])
}

for i in 0..<n {
    let time = t[n - i - 1] + (n - i - 1)
    
    if time <= n {
        dp[n - i - 1] = max(p[n - i - 1] + dp[time], maxValue)
        maxValue = dp[n - i - 1]
    } else {
        dp[n - i - 1] = maxValue
    }
}

print(maxValue)
