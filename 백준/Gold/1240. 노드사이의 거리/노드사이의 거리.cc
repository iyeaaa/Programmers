#include <bits/stdc++.h>

#define FOR(i, l, r) for (int i = l; i < r; i++)
using namespace std;
typedef pair<int, int> pii;

int n, m, v[1001];
vector<pii> g[1001];

int f(int cur, int target, int dist) {
    if (v[cur]) return -1;
    if (cur == target) return dist;

    v[cur] = true;
    for (auto [nxt, edge]: g[cur]) {
        int rtnDist = f(nxt, target, dist + edge);
        if (rtnDist != -1) {
            v[cur] = false;
            return rtnDist;
        }
    }
    v[cur] = false;

    return -1;
}

int main() {
//    freopen("input.txt", "r", stdin);

    cin >> n >> m;
    FOR(i, 0, n-1) {
        int a, b, c;
        cin >> a >> b >> c;
        g[a].emplace_back(b, c);
        g[b].emplace_back(a, c);
    }

    FOR(i, 0, m) {
        int a, b;
        cin >> a >> b;
        cout << f(a, b, 0) << '\n';
    }
}