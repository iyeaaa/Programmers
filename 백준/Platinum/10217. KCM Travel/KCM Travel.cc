

#include <iostream>
#include <cstring>
#include <algorithm>
#include <queue>
#include <tuple>
#include <stdlib.h>
using namespace std;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tiii;

const int INF = 99999999;
int n, m, k, u, v, c, d;
int md[101][10001];

void solve() {
    vector<tiii> g[101];
    priority_queue<tiii, vector<tiii>, greater<tiii>> q;
    fill(&md[0][0], &md[100][10001], INF);
    md[1][0] = 0; q.push({0, 0, 1});

    cin >> n >> m >> k;
    for (int i = 0; i < k; i++)
         cin >> u >> v >> c >> d,
         g[u].push_back({d, c, v});

    while (!q.empty()) {
        auto [dist, curCost, cur] = q.top(); q.pop();
        if (dist > md[cur][curCost]) continue;
        for (auto [edge, nxtCost, next]: g[cur]) {
            int ttlCost = curCost + nxtCost;
            if (ttlCost > m) continue;
            if (edge+dist >= md[next][ttlCost]) continue;
            md[next][ttlCost] = dist+edge;
            q.push({md[next][ttlCost], curCost+nxtCost, next});
        }
    }

    int ans = *min_element(md[n], md[n]+10001);
    cout << (ans == INF ? "Poor KCM" : to_string(ans)) << '\n';
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);
    int t; cin >> t;
    while (t--) solve();
}