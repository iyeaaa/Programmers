/**
* 메모리: 2020 KB, 시간: 1780 ms
* 2022.09.06
* by Alub
*/
#include <iostream>
#include <algorithm>
using namespace std;

int N, M, H, G[11][31], x, y, ans;

int isReached() {
    for (int i = 1; i <= N; i++) {
        int cur = i;
        for (int j = 1; j <= H; j++) {
            if (G[cur-1][j]) cur--;
            else if (G[cur][j]) cur++;
        }
        if (cur != i) return false;
    }
    return true;
}

void dfs(int cnt, int idx) {
    if (cnt >= 4)
        return;

    if (isReached()) {
        ans = min(ans, cnt);
        return;
    }

    for (int i = idx; i < N; i++) {
        for (int j = 1; j <= H; j++) {
            if (G[i-1][j]) continue;
            if (G[i][j]) continue;
            if (G[i+1][j]) continue;
            G[i][j] = true;
            dfs(cnt + 1, i);
            G[i][j] = false;
        }
    }
}

void solve() {
    dfs(0, 1);
    cout << (ans == 999999 ? -1 : ans);
}

void input() {
    cin >> N >> M >> H;
    for (int i = 0; i < M; i++) {
        cin >> x >> y;
        G[y][x] = true;
    }
    ans = 999999;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}