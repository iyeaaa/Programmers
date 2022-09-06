/**
* 메모리: 2024 KB, 시간: 12 ms
* 2022.09.06
* by Alub
*/
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
typedef vector<int> vi;
typedef vector<vi> vvi;

int N, M, D, arch[3], enemyCnt, ans, oriEnmyCnt;
vvi origin(17, vi(17));
vvi G(17, vi(17));

int move() {
    int cnt = 0;
    for (int i = 0; i < M; i++)
        if (G[N-1][i] == 1)
            cnt++;
    for (int i = N-2; i >= 0; i--)
        G[i+1] = G[i];
    G[0] = vi(M, 0);
    return cnt;
}

pair<int, int> findCloseEnemy(int x) {
    int minDist = 999999999;
    int ey = 16, ex = 16;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {

            if (G[i][j] == 0) continue;
            int dist = abs(N-i) + abs(x-j);
            if (dist > D) continue;

            if (minDist > dist || (minDist == dist && ex > j)) {
                minDist = dist;
                ey = i, ex = j;
            }
        }
    }

    return {ey, ex};
}

int attack() {
    int cnt = 0;
    pair<int, int> rmved[3];
    for (int i = 0; i < 3; i++) {
        rmved[i] = findCloseEnemy(arch[i]);
    }
    for (int i = 0; i < 3; i++) {
        auto [y, x] = rmved[i];
        if (y == 16 && x == 16) continue;
        if (G[y][x] == 1) cnt++;
        G[y][x] = 0;
    }
    return cnt;
}

int Game() {
    int cnt = 0;
    while (enemyCnt > 0) {
        int rmv = attack();
        enemyCnt -= rmv;
        cnt += rmv;
        if (enemyCnt <= 0) break;
        enemyCnt -= move();
    }
    return cnt;
}

void solve() {
    for (int i = 0; i < M; i++)
        for (int j = i+1; j < M; j++)
            for (int k = j+1; k < M; k++) {
                enemyCnt = oriEnmyCnt;
                G = origin;
                arch[0] = i;
                arch[1] = j;
                arch[2] = k;
                ans = max(Game(), ans);
            }
    cout << ans;
}

void input() {
    cin >> N >> M >> D;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++) {
            cin >> origin[i][j];
            if (origin[i][j] == 1)
                oriEnmyCnt++;
        }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    input(), solve();
}