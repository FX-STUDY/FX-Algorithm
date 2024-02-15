n = int(input())
data = []
dp = [[0] * i for i in range(1, n)]

for _ in range(n):
    data.append(list(map(int, input().split())))

dp.append(data[-1])

for i in range(n - 2, -1, -1):
    for j in range(i + 1):
        dp[i][j] = max(dp[i + 1][j] + data[i][j], dp[i + 1][j + 1] + data[i][j])

print(dp[0][0])