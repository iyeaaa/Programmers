/**
* 메모리: 3192 KB, 시간: 32 ms
* 2022.08.29
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, x, dp[300001];

void solve() {
    int maxValue = 0;
    for (int i = 0; i < N; i++) {
        cin >> x;
        dp[x] = dp[x-1] + 1;
        maxValue = max(maxValue, dp[x]);
    }
    cout << N - maxValue;
}

void input() {
    cin >> N;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}