#include <string>
#include <vector>
#include <queue>
#include <unordered_set>
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pi;

const int INF = 99999999;
vector<pi> g[50001];
unordered_set<int> sm;

bool isSummit(int x) {
    return sm.find(x) != sm.end();
}


pi f(const vi& gates, const vi& summits) {
    priority_queue<pi, vector<pi>, greater<pi>> pq;
    vi md(50001, INF);
    pi rtn = {INF, 0};
    
    for (int v: gates)
        md[v] = 0,
        pq.push({0, v});
    
    while (!pq.empty()) {
        auto [dist, cur] = pq.top(); pq.pop();
        if (dist > md[cur]) continue;
        if (isSummit(cur)) continue;
        for (auto [edge, nxt]: g[cur]) {
            edge = max(edge, md[cur]);
            if (md[nxt] > edge) {
                md[nxt] = edge;
                pq.push({edge, nxt});
            }
        }
    }
    
    for (int v: summits)
        rtn = min(rtn, {md[v], v});
    
    return rtn;
}

vector<int> solution(int n, vector<vector<int>> paths, vector<int> gates, vector<int> summits) {
    for (int v: summits)
        sm.insert(v);
    
    for (const vi& v: paths)
        g[v[0]].push_back({v[2], v[1]}),
        g[v[1]].push_back({v[2], v[0]});
    
    pi ans = f(gates, summits);
    return {ans.second, ans.first};
}