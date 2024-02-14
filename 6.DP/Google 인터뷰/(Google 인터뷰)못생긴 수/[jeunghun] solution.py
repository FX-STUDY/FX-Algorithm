# 못생긴 수란 오직 2, 3, 5만을 소인수로 가지는 수를 의미합니다.
# 다시 말해 오직 2, 3, 5를 약수로 가지는 합성수를 의미합니다. 1은 무조건 못생긴 수라고 가정합니다.
# 따라서 못생긴 수들은 {1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, ...} 순으로 이어지게 됩니다.
# 이때 n번째 못생긴 수를 찾는 프로그램을 작성하세요. 예를 들어 11번째 못생긴 수는 15입니다.

n = int(input())
dp = [0] * n
dp[0] = 1
idx1, idx2, idx3 = 0, 0, 0
ugly1, ugly2, ugly3 = 2, 3, 5

for k in range(1, n):
    dp[k] = min(ugly1, ugly2, ugly3)

    if dp[k] == ugly1:
        idx1 += 1
        ugly1 = dp[idx1] * 2

    if dp[k] == ugly2:
        idx2 += 1
        ugly2 = dp[idx2] * 3

    if dp[k] == ugly3:
        idx3 += 1
        ugly3 = dp[idx3] * 5

print(dp[n - 1])