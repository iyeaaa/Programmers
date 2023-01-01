
#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tii;

void solve(int T, int N) {
    priority_queue<tii, vector<tii>, greater<tii>> pq;
    int g[N][N];

    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            cin >> g[i][j];

    pq.push({g[0][0], 0, 0});

    while (!pq.empty()) {
        auto [dist, y, x] = pq.top(); pq.pop();
        if (y == N-1 && x == N-1) {
            cout << "Problem " << T << ": " << dist << '\n';
        }
        for (int i = 0; i < 4; i++) {
            int ny = y + "2101"[i] - '1';
            int nx = x + "1012"[i] - '1';
            if (ny<0 || ny>=N || nx<0 || nx>=N || g[ny][nx]=='@') continue;
            pq.push({dist+g[ny][nx], ny, nx});
            g[ny][nx] = '@';
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    int N;
    for (int T = 1;; T++) {
        cin >> N;
        if (N == 0) break;
        solve(T, N);
    }
}