# 그리디(Greedy)
2주차에는 **그리디**에 대해 학습합니다.

## 그리디란?
**탐욕법**이라고도 하는 **그리디** 알고리즘은 **단순 무식하게**, **탐욕적**으로 문제를 해결하는 방법을 말합니다.

여기서 **탐욕적**이란 <span style="color:orange"> 현재 상황에서 지금 당장 좋은 것만을 고르는 방법 </span>을 말합니다.

> ❗️ **그리디** 알고리즘에서는 지금 당장 좋은 것만을 선택하고 이 선택이 나중에 미칠 영향에 대해서는 생각하지 않습니다.

이때 좋은 것을 선택하는 기준은 예를 들어 문제에서 **'합이 최대가 되도록'** 혹은 **'합이 최소가 되도록'** 과 같은 문장이 **그리디** 알고리즘으로 해결하기 위한 기준이 될 수 있습니다.

> ❗️ **최대** 혹은 **최소**를 찾는 문제의 경우 **그리디** 알고리즘만을 사용하는 것이 아닌 **다이나믹 프로그래밍(DP)** 알고리즘과 연계되어 사용될 수 있습니다.

**다이나믹 프로그래밍(DP)** 알고리즘과 연계되어 사용 되는 경우, 주어진 문제를 여러 개의 부분 문제로 쪼개고 그 부분 문제의 **최대** 혹은 **최소**의 최적의 해를 도출하고 저장하기 위해 지금 당장 좋은 것을 선택하는 **그리디** 알고리즘과 연계하여 문제를 해결할 수 있습니다.

아래의 예제는 단순히 **그리디** 알고리즘을 활용하는 예시를 보여줍니다.

## Example (1이 될 때까지)
어떠한 수 n이 1이 될 때까지 아래의 두 과정 중 하나를 반복한다.
  1. n에서 1을 뺀다.
  2. n을 k로 나눈다. (단, 2번 과정은 n이 k로 나누어 떨어질 때만 수행 가능하다.)

만약 n이 17, k가 4라고 할때, 1번 과정을 한 번 수행하면 n은 16이 되고, 2번 과정을 두 번 수행하면 n은 1이되어 총 3번의 연산을 수행하여 n을 1로 만들 수 있다. 이때 나온 3이 n을 1로 만들기 위한 최소 횟수이다.

n과 k가 주어질 때 1번 또는 2번 과정을 수행하여 n을 1로 만들기 위한 최소 횟수를 구하는 프로그램을 작성하시오.

### 입력조건
첫째줄에 n(2 <= n <= 100,000)과 k(2 <= k <= 100,000)가 공백으로 구분되어 입력된다. 이때 n은 항상 k보다 크거나 같다.

### 출력조건
첫째 줄에 n이 1이 되기 위해 1번과 2번 과정을 수행해야 하는 최소값을 출력한다.

### 입력 예시
```
25 5
```

### 출력 예시
```
2
```

### 💡 문제를 해결하기 위한 아이디어
연산 횟수를 최소로 하기 위해서는 'n을 k로 최대한 많이 나누는 것이 1을 빼는 것 보다 연산 횟수를 줄일 수 있는 방법이다' 라는 것을 떠올리는 것에서 시작합니다. 왜냐하면 어떤 숫자를 2 이상의 숫자로 나누는 것이 1을 빼는 것보다 더 빠르게 숫자가 작아지기 때문입니다.

다만 k는 2이 상의 자연수 이므로 n이 k의 배수가 아니라면 1번 과정을 통해 n에서 1씩 빼서 n이 k의 배수가 되도록 하는 것이 중요합니다.

예를 들어 n이 25이고 k가 3이라고 가정하고 **그리디** 알고리즘을 적용하여 25를 1로 만드는 과정은 다음과 같습니다.

- 25 - 1 = 24
- 24 / 3 = 8
- 8 - 1 = 7
- 7 - 1 = 6
- 6 / 3 = 2
- 2 - 1 = 1

따라서 총 6단계를 걸쳐 25를 1로 만들 수 있습니다.

이렇듯 k가 2 이상일 때, n에서 k로 가장 많이 나누는 것이 최적의 해를 보장한다는 것을 알 수 있습니다.

### solution.py

```python
n, k = map(int, input().split())
count = 0    # 연산 횟수

while n >= k:
    # n이 k의 배수가 아니라면 n에서 1씩 빼기
    while n % k != 0:
        n -= 1
        count += 1

    # n이 k의 배수라면 n을 k로 나누기
    n //= k
    count += 1

# 나머지 값을 1씩 빼기
while n > 1:
    n -= 1
    count += 1

print(count)
```

### solution.java

```java
import java.util.Scanner;

public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = Integer.parseInt(scanner.next());
        int k = Integer.parseInt(scanner.next());
        int count = 0;    //연산 횟수

        while (n >= k) {
            //n이 k의 배수가 아니라면 n에서 1씩 빼기
            while (n % k != 0) {
                n -= 1;
                count += 1;
            }

            //n이 k의 배수라면 n을 k로 나누기
            n /= k;
            count += 1;
        }

        // 나머지 값을 1씩 빼기
        while (n > 1) {
            n -= 1;
            count += 1;
        }

        System.out.println(count);
    }
}
```