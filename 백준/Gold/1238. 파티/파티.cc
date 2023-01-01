
#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;
typedef long long int lli;
typedef pair<int, int> pii;

int n, m, x, s, e, t, mindist[2][1005], ans;
vector<pii> g[2][1005];

void Dijkstra(int k) {
    priority_queue<pii, vector<pii>, greater<pii>> pq;
    pq.push({0, x});

    while (!pq.empty()) {
        auto [dist, cur] = pq.top(); pq.pop();
        for (auto [edge, next]: g[k][cur]) {
            if (edge + dist >= mindist[k][next]) continue;
            mindist[k][next] = edge + dist;
            pq.push({edge+dist, next});
        }
    }
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> m >> x;
    fill(mindist[0], mindist[0]+n+1, 99999999);
    fill(mindist[1], mindist[1]+n+1, 99999999);
    for (int i = 0; i < m; i++)
        cin >> s >> e >> t,
        g[0][e].push_back({t, s}),
        g[1][s].push_back({t, e});
    mindist[0][x] = 0;
    mindist[1][x] = 0;

    Dijkstra(0);
    Dijkstra(1);

    for (int i = 1; i <= n; i++)
        ans = max(ans, mindist[0][i] + mindist[1][i]);

    cout << ans;
}
