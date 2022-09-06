/**
* 메모리: 2028 KB, 시간: 120 ms
* 2022.09.06
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, K, V[200], ans;
string L[51];

int canRead() {
    int cnt = 0;
    for (int i = 0; i < N; i++) {
        bool canread = true;
        for (int j = 4; j <= L[i].size()-4; j++) {
            if (!V[L[i][j]]) {
                canread = false;
                break;
            }
        }
        if (canread) cnt++;
    }
    return cnt;
}

// 필수 : a, n, t, i, c
void dfs(int cnt, int idx) {
    if (cnt == K) {
        ans = max(ans, canRead());
        return;
    }

    for (int i = idx; i <= 'z'; i++) {
        if (V[i]) continue;
        V[i] = true;
        dfs(cnt + 1, i+1);
        V[i] = false;
    }
}

void solve() {
    dfs(0, 'b');
    cout << ans;
}

void input() {
    cin >> N >> K;
    for (int i = 0; i < N; i++)
        cin >> L[i];
    V['a'] = true;
    V['n'] = true;
    V['t'] = true;
    V['i'] = true;
    V['c'] = true;

    if (K < 5) {
        cout << 0;
        exit(0);
    }

    K -= 5;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}