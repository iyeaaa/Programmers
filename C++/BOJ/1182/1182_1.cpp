/**
* 메모리: 2020 KB, 시간: 40 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, S, L[21], answer;

void dfs(int cnt, int M, int sum, int idx) {
    if (cnt == M) {
        if (sum == S)
            answer++;
        return;
    }
    for (int i = idx; i < N; i++)
        dfs(cnt + 1, M, sum + L[i], i+1);
}

void solve() {
    for (int i = 1; i <= N; i++)
        dfs(0, i, 0, 0);
    cout << answer;
}

void input() {
    cin >> N >> S;
    for (int i = 0; i < N; i++)
        cin >> L[i];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}
