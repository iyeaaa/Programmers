
// T.C: O(M*logN)*M = 5000*3*5000 < 1e8

#include <iostream>
#include <cstring>
#include <algorithm>
#include <queue>
#include <tuple>
#include <stdlib.h>
using namespace std;
typedef pair<int, int> pii;
typedef tuple<int, int, int> tiii;

const int INF = 999999999;
int n, m, md[1001], a, b, t, ans;
vector<int> parent(1001);
vector<pii> g[1001];

int dijkstra(int s, int e) {
    fill(md, md+1001, INF);
    priority_queue<pii, vector<pii>, greater<pii>> q;
    q.push({0, 1});
    md[1] = 0;

    while (!q.empty()) {
        auto [dist, cur] = q.top(); q.pop();
        if (dist > md[cur]) continue;
        for (auto [edge, next]: g[cur]) {
            if (dist+edge >= md[next]) continue;
            if (cur==s && next==e || cur==e && next==s) continue;
            md[next] = dist + edge;
            q.push({md[next], next});
            parent[next] = cur;
        }
    }

    return md[n];
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr); cout.tie(nullptr);

    cin >> n >> m;
    for (int i = 0; i < m; i++)
        cin >> a >> b >> t,
        g[a].push_back({t, b}),
        g[b].push_back({t, a});

    int fmd = dijkstra(0, 0);
    vector<int> fp = parent;

    int start = n;
    while (fp[start] != 0) {
        ans = max(ans, dijkstra(start, fp[start]) - fmd);
        start = fp[start];
    }

    cout << (ans == INF-fmd ? -1 : ans);
}