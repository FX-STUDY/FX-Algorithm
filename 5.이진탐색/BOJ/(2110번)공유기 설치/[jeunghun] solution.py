import sys

n, c = map(int, input().split())
houses = sorted([int(sys.stdin.readline()) for _ in range(n)])
start, end = 1, houses[-1] - houses[0]
result = 0

while start <= end:
    mid = (start + end) // 2
    cnt = 1
    pos = houses[0]

    for house in houses:
        if house - pos >= mid:
            cnt += 1
            pos = house
    
    if cnt >= c:
        start = mid + 1
        result = mid
    else:
        end = mid - 1

print(result)