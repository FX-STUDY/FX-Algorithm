# N개의 원소를 포함하고 있는 수열이 오름차순으로 정렬되어 있습니다. 이때 이 수열에서 x가 등장하는 횟수를 계산하세요.
# 예를 들어 수열 {1, 1, 2, 2, 2, 2, 3}이 있을때 x = 2라면, 현재 수열에서 값이 2인 원소가 4개이므로 4를 출력합니다.
# 단, 이 문제는 시간 복잡도 O(logN)으로 알고리즘을 설계하지 않으면 시간 초과 판정을 받습니다.

# 가장 왼쪽 인덱스 찾기
def find_left(arr, target, start, end):
    while start <= end:
        mid = (start + end) // 2

        if arr[mid] == target:
            if mid == 0 or arr[mid - 1] != arr[mid]:
                return mid
            else:
                end = mid - 1
        elif arr[mid] > target:
            end = mid - 1
        else:
            start = mid + 1
            
    return None

# 가장 오른쪽 인덱스 찾기
def find_right(arr, target, start, end):
    while start <= end:
        mid = (start + end) // 2

        if arr[mid] == target:
            if mid == len(arr) - 1 or arr[mid + 1] != arr[mid]:
                return mid
            else:
                start = mid + 1
        elif arr[mid] > target:
            end = mid - 1
        else:
            start = mid + 1

    return None

n, x = map(int, input().split())
data = list(map(int, input().split()))
idx1, idx2 = find_left(data, x, 0, n - 1), find_right(data, x, 0, n - 1)

if idx1 is None or idx2 is None:
    print(-1)
else:
    print(idx2 - idx1 + 1)