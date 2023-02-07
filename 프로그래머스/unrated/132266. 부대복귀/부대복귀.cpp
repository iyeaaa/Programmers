#include <string>
#include <vector>
#include <queue>
using namespace std;

vector<int> g[100'101];
vector<int> result;

int f(int s, int e, int n) {
    vector<int> v(n+1, -1);
    v[s] = 0;
    
    queue<int> q;
    q.push(s);
    
    while (!q.empty()) {
        int cur = q.front(); q.pop();
        if (cur == e) break;
        for (auto& nxt: g[cur]) if (v[nxt] == -1) {
            q.push(nxt);
            v[nxt] = v[cur] + 1;
        }
    }
    
    return v[e];
}

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    for (auto& v: roads)
        g[v[0]].push_back(v[1]),
        g[v[1]].push_back(v[0]);
    
    for (auto& v: sources)
        result.push_back(f(v, destination, n));
    
    return result;
}