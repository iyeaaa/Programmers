#include <bits/stdc++.h>
using namespace std;
typedef vector<int> vi;
typedef tuple<int, int, int> ti;

int n, s, e;
vector<int> traps;
int cost[1001][1001];
const int INF = 1'000'000'000;

int istrap(int x) {
    auto pos = find(traps.begin(), traps.end(), x);
    return pos == traps.end() ? -1 : pos - traps.begin();
}

bool ison(int x, int bit) {
    int idx = istrap(x);
    return idx != -1 && (bit & 1<<idx);
}

int f() {
    priority_queue<ti, vector<ti>, greater<ti>> pq;
    int md[n+1][1024];
    
    fill(&md[0][0], &md[n][1024], INF);
    pq.push({0, s, 0});
    md[s][0] = 0;
    
    while (!pq.empty()) {
        auto [dist, cur, bit] = pq.top(); pq.pop();
        if (md[cur][bit] < dist) continue;
        if (cur == e) return md[e][bit];
        bool on = ison(cur, bit);
        for (int nxt=1; nxt<=n; nxt++) {
            if (cur == nxt) continue;
            int edge = on == ison(nxt, bit) ? cost[cur][nxt] : cost[nxt][cur];
            int idx = istrap(nxt);
            int nxtbit = idx != -1 ? (bit ^ 1<<idx) : bit;
            if (dist + edge >= md[nxt][nxtbit]) continue;
            pq.push({dist + edge, nxt, nxtbit});
            md[nxt][nxtbit] = dist + edge;
        }
    }
    
    return *min_element(md[e], md[e]+1024);
}

int solution(int tn, int stt, int ed, vector<vi> roads, vector<int> trap) {
    n = tn, s = stt, e = ed;
    fill(&cost[0][0], &cost[n][n+1], INF);
    traps = trap;
    
    for (const vi& v: roads)
        cost[v[0]][v[1]] = min(cost[v[0]][v[1]], v[2]);
    
    return f();
}