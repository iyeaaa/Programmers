/**
* 메모리: 2020 KB, 시간: 0 ms
* 2022.09.01
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, S, L[21], answer;

void dfs(int idx, int sum) {
    if (idx == N)
        return;

    if (sum + L[idx] == S)
        answer++;

    dfs(idx+1, sum+L[idx]);
    dfs(idx+1, sum);
}

void solve() {
    dfs(0, 0);
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
